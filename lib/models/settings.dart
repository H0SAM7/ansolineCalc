import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  double insulinSensitivityFactor;

  @HiveField(1)
  double carbohydrateRatio;

  @HiveField(2)
  bool isSetupComplete;

  @HiveField(3)
  String language;

  @HiveField(4)
  bool isDarkMode;

  Settings({
    required this.insulinSensitivityFactor,
    required this.carbohydrateRatio,
    this.isSetupComplete = false,
    this.language = 'en',
    this.isDarkMode = false,
  });

  // Add a method to convert to/from Map for debugging
  Map<String, dynamic> toMap() {
    return {
      'insulinSensitivityFactor': insulinSensitivityFactor,
      'carbohydrateRatio': carbohydrateRatio,
      'isSetupComplete': isSetupComplete,
      'language': language,
      'isDarkMode': isDarkMode,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      insulinSensitivityFactor: map['insulinSensitivityFactor']?.toDouble() ?? 50.0,
      carbohydrateRatio: map['carbohydrateRatio']?.toDouble() ?? 15.0,
      isSetupComplete: map['isSetupComplete'] ?? false,
      language: map['language'] ?? 'en',
      isDarkMode: map['isDarkMode'] ?? false,
    );
  }
}