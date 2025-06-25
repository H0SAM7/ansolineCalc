import 'package:calculator/calculator_screen.dart';
import 'package:calculator/generated/l10n.dart';
import 'package:calculator/language_service.dart';
import 'package:calculator/setup_screen.dart';
import 'package:calculator/splash_screen.dart';
import 'package:calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  try {
    // Initialize Hive
    await Hive.initFlutter();
    
    // Register adapter
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SettingsAdapter());
    }
    
    // Try to open the box, if it fails, delete and recreate
    try {
      await Hive.openBox<Settings>('settings');
    } catch (e) {
      // If there's an error opening the box (like type mismatch), delete it
      await Hive.deleteBoxFromDisk('settings');
      await Hive.openBox<Settings>('settings');
    }
    
  } catch (e) {
    print('Error initializing Hive: $e');
  }
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageService()..loadLanguage(),
      child: const InsulinCalculatorApp(),
    ),
  );
}

class InsulinCalculatorApp extends StatelessWidget {
  const InsulinCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageService>(
      builder: (context, languageService, child) {
        final isArabic = languageService.isArabic;
        
        return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size (iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
     
          builder: (context, snapshot) {
            return MaterialApp(
              title: 'Insulin Calculator',
              locale: languageService.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              theme: isArabic 
                ? AppTheme.getArabicTheme(AppTheme.lightTheme, true)
                : AppTheme.lightTheme,
              darkTheme: isArabic 
                ? AppTheme.getArabicTheme(AppTheme.darkTheme, false)
                : AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              initialRoute: '/splash',
              routes: {
                '/splash': (context) => const SplashScreen(),
                '/main': (context) => const AppWrapper(),
              },
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return Directionality(
                  textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                  child: child!,
                );
              },
            );
          }
        );
      },
    );
  }
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeHive(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Restart the app
                      main();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }
        
        return ValueListenableBuilder<Box<Settings>>(
          valueListenable: Hive.box<Settings>('settings').listenable(),
          builder: (context, box, _) {
            try {
              final settings = box.get('user_settings');
              
              if (settings?.isSetupComplete == true) {
                return CalculatorScreen(settings: settings!);
              } else {
                return const SetupScreen();
              }
            } catch (e) {
              // If there's an error reading the settings, clear the box and start fresh
              box.clear();
              return const SetupScreen();
            }
          },
        );
      },
    );
  }

  Future<void> _initializeHive() async {
    // Ensure the box is open and accessible
    if (!Hive.isBoxOpen('settings')) {
      await Hive.openBox<Settings>('settings');
    }
  }
}