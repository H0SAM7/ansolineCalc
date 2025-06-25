// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 0;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      insulinSensitivityFactor: fields[0] as double,
      carbohydrateRatio: fields[1] as double,
      isSetupComplete: fields[2] as bool,
      language: fields[3] as String,
      isDarkMode: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.insulinSensitivityFactor)
      ..writeByte(1)
      ..write(obj.carbohydrateRatio)
      ..writeByte(2)
      ..write(obj.isSetupComplete)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.isDarkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
