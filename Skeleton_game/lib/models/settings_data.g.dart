// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsDataAdapter extends TypeAdapter<SettingsData> {
  @override
  final int typeId = 1;

  @override
  SettingsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsData()
      .._bgm = fields[0] as bool
      .._sfx = fields[1] as bool
      .._halloweenMode = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, SettingsData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._bgm)
      ..writeByte(1)
      ..write(obj._sfx)
      ..writeByte(2)
      ..write(obj._halloweenMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
