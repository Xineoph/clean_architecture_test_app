// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeModelAdapter extends TypeAdapter<JokeModel> {
  @override
  final int typeId = 0;

  @override
  JokeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JokeModel(
      setup: fields[1] as String,
      punchline: fields[0] as String,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JokeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.punchline)
      ..writeByte(1)
      ..write(obj.setup)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
