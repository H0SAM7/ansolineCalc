// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Insulin Calculator`
  String get appTitle {
    return Intl.message(
      'Insulin Calculator',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to\nInsulin Calculator`
  String get welcome {
    return Intl.message(
      'Welcome to\nInsulin Calculator',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your insulin parameters to get started`
  String get setupSubtitle {
    return Intl.message(
      'Please enter your insulin parameters to get started',
      name: 'setupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Insulin Sensitivity Factor (ISF)`
  String get insulinSensitivityFactor {
    return Intl.message(
      'Insulin Sensitivity Factor (ISF)',
      name: 'insulinSensitivityFactor',
      desc: '',
      args: [],
    );
  }

  /// `Carbohydrate Ratio`
  String get carbohydrateRatio {
    return Intl.message(
      'Carbohydrate Ratio',
      name: 'carbohydrateRatio',
      desc: '',
      args: [],
    );
  }

  /// `e.g., 50`
  String get isfHint {
    return Intl.message(
      'e.g., 50',
      name: 'isfHint',
      desc: '',
      args: [],
    );
  }

  /// `e.g., 15`
  String get carbRatioHint {
    return Intl.message(
      'e.g., 15',
      name: 'carbRatioHint',
      desc: '',
      args: [],
    );
  }

  /// `mg/dL per unit`
  String get isfUnit {
    return Intl.message(
      'mg/dL per unit',
      name: 'isfUnit',
      desc: '',
      args: [],
    );
  }

  /// `grams per unit`
  String get carbRatioUnit {
    return Intl.message(
      'grams per unit',
      name: 'carbRatioUnit',
      desc: '',
      args: [],
    );
  }

  /// `How much 1 unit of insulin lowers blood glucose`
  String get isfDescription {
    return Intl.message(
      'How much 1 unit of insulin lowers blood glucose',
      name: 'isfDescription',
      desc: '',
      args: [],
    );
  }

  /// `How many grams of carbs 1 unit of insulin covers`
  String get carbRatioDescription {
    return Intl.message(
      'How many grams of carbs 1 unit of insulin covers',
      name: 'carbRatioDescription',
      desc: '',
      args: [],
    );
  }

  /// `Save Settings`
  String get saveSettings {
    return Intl.message(
      'Save Settings',
      name: 'saveSettings',
      desc: '',
      args: [],
    );
  }

  /// `Settings saved successfully!`
  String get settingsSaved {
    return Intl.message(
      'Settings saved successfully!',
      name: 'settingsSaved',
      desc: '',
      args: [],
    );
  }

  /// `Current Blood Glucose`
  String get currentBloodGlucose {
    return Intl.message(
      'Current Blood Glucose',
      name: 'currentBloodGlucose',
      desc: '',
      args: [],
    );
  }

  /// `Carbohydrates Intake`
  String get carbohydratesIntake {
    return Intl.message(
      'Carbohydrates Intake',
      name: 'carbohydratesIntake',
      desc: '',
      args: [],
    );
  }

  /// `Enter blood glucose level`
  String get glucoseHint {
    return Intl.message(
      'Enter blood glucose level',
      name: 'glucoseHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter carbohydrates amount`
  String get carbsHint {
    return Intl.message(
      'Enter carbohydrates amount',
      name: 'carbsHint',
      desc: '',
      args: [],
    );
  }

  /// `mg/dL`
  String get glucoseUnit {
    return Intl.message(
      'mg/dL',
      name: 'glucoseUnit',
      desc: '',
      args: [],
    );
  }

  /// `grams`
  String get carbsUnit {
    return Intl.message(
      'grams',
      name: 'carbsUnit',
      desc: '',
      args: [],
    );
  }

  /// `Calculate Dose`
  String get calculateDose {
    return Intl.message(
      'Calculate Dose',
      name: 'calculateDose',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clearFields {
    return Intl.message(
      'Clear',
      name: 'clearFields',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Insulin Dose`
  String get recommendedDose {
    return Intl.message(
      'Recommended Insulin Dose',
      name: 'recommendedDose',
      desc: '',
      args: [],
    );
  }

  /// `units`
  String get units {
    return Intl.message(
      'units',
      name: 'units',
      desc: '',
      args: [],
    );
  }

  /// `Always consult your healthcare provider`
  String get safetyWarning {
    return Intl.message(
      'Always consult your healthcare provider',
      name: 'safetyWarning',
      desc: '',
      args: [],
    );
  }

  /// `Important Safety Information`
  String get safetyInfo {
    return Intl.message(
      'Important Safety Information',
      name: 'safetyInfo',
      desc: '',
      args: [],
    );
  }

  /// `• This app is for educational purposes only\n• Always verify calculations with your healthcare provider\n• Monitor blood glucose levels regularly\n• Seek immediate medical attention for emergencies`
  String get safetyText {
    return Intl.message(
      '• This app is for educational purposes only\n• Always verify calculations with your healthcare provider\n• Monitor blood glucose levels regularly\n• Seek immediate medical attention for emergencies',
      name: 'safetyText',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Reset All Settings`
  String get resetSettings {
    return Intl.message(
      'Reset All Settings',
      name: 'resetSettings',
      desc: '',
      args: [],
    );
  }

  /// `Reset Settings`
  String get resetConfirmTitle {
    return Intl.message(
      'Reset Settings',
      name: 'resetConfirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset all settings? This will clear your saved parameters.`
  String get resetConfirmText {
    return Intl.message(
      'Are you sure you want to reset all settings? This will clear your saved parameters.',
      name: 'resetConfirmText',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Settings updated successfully!`
  String get settingsUpdated {
    return Intl.message(
      'Settings updated successfully!',
      name: 'settingsUpdated',
      desc: '',
      args: [],
    );
  }

  /// `About These Settings`
  String get aboutSettings {
    return Intl.message(
      'About These Settings',
      name: 'aboutSettings',
      desc: '',
      args: [],
    );
  }

  /// `These values should be determined by your healthcare provider based on your individual needs. They may change over time and should be regularly reviewed.`
  String get aboutSettingsText {
    return Intl.message(
      'These values should be determined by your healthcare provider based on your individual needs. They may change over time and should be regularly reviewed.',
      name: 'aboutSettingsText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter ISF value`
  String get pleaseEnterISF {
    return Intl.message(
      'Please enter ISF value',
      name: 'pleaseEnterISF',
      desc: '',
      args: [],
    );
  }

  /// `Please enter carb ratio value`
  String get pleaseEnterCarbRatio {
    return Intl.message(
      'Please enter carb ratio value',
      name: 'pleaseEnterCarbRatio',
      desc: '',
      args: [],
    );
  }

  /// `Please enter blood glucose level`
  String get pleaseEnterGlucose {
    return Intl.message(
      'Please enter blood glucose level',
      name: 'pleaseEnterGlucose',
      desc: '',
      args: [],
    );
  }

  /// `Please enter carbohydrates amount`
  String get pleaseEnterCarbs {
    return Intl.message(
      'Please enter carbohydrates amount',
      name: 'pleaseEnterCarbs',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number`
  String get enterValidNumber {
    return Intl.message(
      'Please enter a valid number',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a realistic glucose value`
  String get realisticGlucose {
    return Intl.message(
      'Please enter a realistic glucose value',
      name: 'realisticGlucose',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a realistic carb value`
  String get realisticCarbs {
    return Intl.message(
      'Please enter a realistic carb value',
      name: 'realisticCarbs',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Current Value`
  String get currentValue {
    return Intl.message(
      'Current Value',
      name: 'currentValue',
      desc: '',
      args: [],
    );
  }

  /// `Update Settings`
  String get updateSettings {
    return Intl.message(
      'Update Settings',
      name: 'updateSettings',
      desc: '',
      args: [],
    );
  }

  /// `Modify your insulin calculation parameters`
  String get updateSubtitle {
    return Intl.message(
      'Modify your insulin calculation parameters',
      name: 'updateSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Setup`
  String get setupTitle {
    return Intl.message(
      'Setup',
      name: 'setupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a realistic ISF value (1-1000)`
  String get enterRealisticISF {
    return Intl.message(
      'Please enter a realistic ISF value (1-1000)',
      name: 'enterRealisticISF',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a realistic carb ratio (1-100)`
  String get enterRealisticCarbRatio {
    return Intl.message(
      'Please enter a realistic carb ratio (1-100)',
      name: 'enterRealisticCarbRatio',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Your Health Companion`
  String get appSubtitle {
    return Intl.message(
      'Your Health Companion',
      name: 'appSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Developed By`
  String get developedBy {
    return Intl.message(
      'Developed By',
      name: 'developedBy',
      desc: '',
      args: [],
    );
  }

  /// `App Features`
  String get appFeatures {
    return Intl.message(
      'App Features',
      name: 'appFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Accurate Calculations`
  String get feature1Title {
    return Intl.message(
      'Accurate Calculations',
      name: 'feature1Title',
      desc: '',
      args: [],
    );
  }

  /// `Uses proven medical formulas for insulin dose calculation`
  String get feature1Description {
    return Intl.message(
      'Uses proven medical formulas for insulin dose calculation',
      name: 'feature1Description',
      desc: '',
      args: [],
    );
  }

  /// `Multilingual Support`
  String get feature2Title {
    return Intl.message(
      'Multilingual Support',
      name: 'feature2Title',
      desc: '',
      args: [],
    );
  }

  /// `Available in Arabic and English with proper RTL support`
  String get feature2Description {
    return Intl.message(
      'Available in Arabic and English with proper RTL support',
      name: 'feature2Description',
      desc: '',
      args: [],
    );
  }

  /// `Secure & Private`
  String get feature3Title {
    return Intl.message(
      'Secure & Private',
      name: 'feature3Title',
      desc: '',
      args: [],
    );
  }

  /// `All data is stored locally on your device`
  String get feature3Description {
    return Intl.message(
      'All data is stored locally on your device',
      name: 'feature3Description',
      desc: '',
      args: [],
    );
  }

  /// `Modern Design`
  String get feature4Title {
    return Intl.message(
      'Modern Design',
      name: 'feature4Title',
      desc: '',
      args: [],
    );
  }

  /// `Beautiful, accessible, and easy-to-use interface`
  String get feature4Description {
    return Intl.message(
      'Beautiful, accessible, and easy-to-use interface',
      name: 'feature4Description',
      desc: '',
      args: [],
    );
  }

  /// `Medical Disclaimer`
  String get medicalDisclaimer {
    return Intl.message(
      'Medical Disclaimer',
      name: 'medicalDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `This application is designed for educational purposes and as a calculation aid. It should not replace professional medical advice, diagnosis, or treatment. Always consult with qualified healthcare professionals before making any medical decisions. The developers are not responsible for any medical outcomes resulting from the use of this application.`
  String get disclaimerText {
    return Intl.message(
      'This application is designed for educational purposes and as a calculation aid. It should not replace professional medical advice, diagnosis, or treatment. Always consult with qualified healthcare professionals before making any medical decisions. The developers are not responsible for any medical outcomes resulting from the use of this application.',
      name: 'disclaimerText',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `For support, feedback, or medical consultations, please contact our medical team:`
  String get contactText {
    return Intl.message(
      'For support, feedback, or medical consultations, please contact our medical team:',
      name: 'contactText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `All rights reserved`
  String get allRightsReserved {
    return Intl.message(
      'All rights reserved',
      name: 'allRightsReserved',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
