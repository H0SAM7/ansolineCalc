import 'package:calculator/calculator_screen.dart';
import 'package:calculator/generated/l10n.dart';
import 'package:calculator/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../models/settings.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _isfController = TextEditingController();
  final _carbRatioController = TextEditingController();
  bool _isLoading = false;
  Settings? _currentSettings;

  @override
  void initState() {
    super.initState();
    _loadCurrentSettings();
  }

  void _loadCurrentSettings() async {
    try {
      final box = Hive.box<Settings>('settings');
      final settings = box.get('user_settings');
      if (settings != null && mounted) {
        setState(() {
          _currentSettings = settings;
          // Pre-fill the text controllers with existing values
          _isfController.text = settings.insulinSensitivityFactor.toString();
          _carbRatioController.text = settings.carbohydrateRatio.toString();
        });
      }
    } catch (e) {
      // Handle any errors in loading settings
      debugPrint('Error loading settings: $e');
    }
  }

  @override
  void dispose() {
    _isfController.dispose();
    _carbRatioController.dispose();
    super.dispose();
  }

  void _saveSettings() async {
    if (_formKey.currentState!.validate()) {
      // Check if widget is still mounted before setting loading state
      if (!mounted) return;

      setState(() => _isLoading = true);

      try {
        await Future.delayed(const Duration(milliseconds: 800));

        // Check if widget is still mounted before proceeding
        if (!mounted) return;

        final languageService = Provider.of<LanguageService>(
          context,
          listen: false,
        );

        final settings = Settings(
          insulinSensitivityFactor: double.parse(_isfController.text),
          carbohydrateRatio: double.parse(_carbRatioController.text),
          isSetupComplete: true,
          language: languageService.locale.languageCode,
        );

        final box = Hive.box<Settings>('settings');
        await box.put('user_settings', settings);

        // Check if widget is still mounted before showing snackbar and navigating
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).settingsSaved),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );

          // Navigate back to calculator screen after saving
          Navigator.pushReplacementNamed(context,'/main');
        }
      } catch (e) {
        // Handle any errors during saving
        debugPrint('Error saving settings: $e');

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error saving settings: $e'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        }
      } finally {
        // Only set loading to false if widget is still mounted
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final languageService = Provider.of<LanguageService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _currentSettings != null ? l10n.updateSettings : l10n.setupTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),

                  // Language Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: languageService.locale.languageCode,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            borderRadius: BorderRadius.circular(25.r),
                            items: [
                              DropdownMenuItem(
                                value: 'en',
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '🇺🇸',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'English',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'ar',
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '🇸🇦',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'العربية',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null && mounted) {
                                languageService.changeLanguage(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.h),

                  // App Icon with Animation
                  Center(
                    child: Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2E7CEE), Color(0xFF00D4C7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF2E7CEE).withOpacity(0.3),
                            blurRadius: 20.r,
                            offset: Offset(0, 8.h),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.medical_services_rounded,
                        size: 60.sp,
                        color: Colors.white,
                      ),
                    ).animate().scale(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.elasticOut,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Welcome Text
                  Text(
                    _currentSettings != null
                        ? l10n.updateSettings
                        : l10n.welcome,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontSize: 28.sp,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.3, end: 0),

                  SizedBox(height: 16.h),

                  Text(
                    _currentSettings != null
                        ? l10n.updateSubtitle
                        : l10n.setupSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      height: 1.4,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.3, end: 0),

                  SizedBox(height: 48.h),

                  // ISF Card
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E7CEE).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.trending_down_rounded,
                                color: const Color(0xFF2E7CEE),
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                l10n.insulinSensitivityFactor,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: _isfController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: TextStyle(fontSize: 16.sp),
                          decoration: InputDecoration(
                            hintText: l10n.isfHint,
                            hintStyle: TextStyle(fontSize: 16.sp),
                            suffixText: l10n.isfUnit,
                            suffixStyle: TextStyle(fontSize: 14.sp),
                            prefixIcon: Icon(
                              Icons.monitor_heart_outlined,
                              size: 20.sp,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return l10n.pleaseEnterISF;
                            }
                            final num = double.tryParse(value!);
                            if (num == null) {
                              return l10n.enterValidNumber;
                            }
                            if (num <= 0 || num > 1000) {
                              return l10n.enterRealisticISF;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 16.sp,
                                color: Colors.blue.shade600,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  l10n.isfDescription,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color: Colors.blue.shade700,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 700.ms).slideX(begin: 0.3, end: 0),

                  SizedBox(height: 24.h),

                  // Carb Ratio Card
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00D4C7).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.restaurant_rounded,
                                color: const Color(0xFF00D4C7),
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                l10n.carbohydrateRatio,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: _carbRatioController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: TextStyle(fontSize: 16.sp),
                          decoration: InputDecoration(
                            hintText: l10n.carbRatioHint,
                            hintStyle: TextStyle(fontSize: 16.sp),
                            suffixText: l10n.carbRatioUnit,
                            suffixStyle: TextStyle(fontSize: 14.sp),
                            prefixIcon: Icon(Icons.grain_rounded, size: 20.sp),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return l10n.pleaseEnterCarbRatio;
                            }
                            final num = double.tryParse(value!);
                            if (num == null) {
                              return l10n.enterValidNumber;
                            }
                            if (num <= 0 || num > 100) {
                              return l10n.enterRealisticCarbRatio;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 16.sp,
                                color: Colors.teal.shade600,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  l10n.carbRatioDescription,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color: Colors.teal.shade700,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 900.ms).slideX(begin: -0.3, end: 0),

                  SizedBox(height: 40.h),

                  // Save Button
                  AnimatedButton(
                    onPressed: _isLoading ? null : _saveSettings,
                    isLoading: _isLoading,
                    child: Text(
                      _currentSettings != null
                          ? l10n.updateSettings
                          : l10n.saveSettings,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ).animate().fadeIn(delay: 1100.ms).slideY(begin: 0.3, end: 0),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
