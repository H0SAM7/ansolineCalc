import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/settings.dart';

class LanguageService extends ChangeNotifier {
  Locale _locale = const Locale('en');
  
  Locale get locale => _locale;
  
  bool get isArabic => _locale.languageCode == 'ar';
  
  void changeLanguage(String languageCode) {
    _locale = Locale(languageCode);
    _saveLanguage(languageCode);
    notifyListeners();
  }
  
  void _saveLanguage(String languageCode) async {
    try {
      final box = Hive.box<Settings>('settings');
      final settings = box.get('user_settings');
      if (settings != null) {
        settings.language = languageCode;
        await settings.save();
      } else {
        // Create new settings if none exist
        final newSettings = Settings(
          insulinSensitivityFactor: 50.0,
          carbohydrateRatio: 15.0,
          language: languageCode,
        );
        await box.put('user_settings', newSettings);
      }
    } catch (e) {
      print('Error saving language: $e');
    }
  }
  
  void loadLanguage() {
    try {
      if (Hive.isBoxOpen('settings')) {
        final box = Hive.box<Settings>('settings');
        final settings = box.get('user_settings');
        if (settings != null && settings.language.isNotEmpty) {
          _locale = Locale(settings.language);
        }
      }
    } catch (e) {
      print('Error loading language: $e');
      // Default to English if there's an error
      _locale = const Locale('en');
    }
  }
}