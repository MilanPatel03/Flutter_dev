// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geetaslokmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeetaSlokModelAdapter extends TypeAdapter<GeetaSlokModel> {
  @override
  final int typeId = 0;

  @override
  GeetaSlokModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeetaSlokModel(
      id: fields[0] as String?,
      chapter: fields[1] as int,
      verse: fields[2] as int,
      slok: fields[3] as String?,
      transliteration: fields[4] as String?,
      translations: (fields[5] as Map).cast<String, AuthorContent>(),
    );
  }

  @override
  void write(BinaryWriter writer, GeetaSlokModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapter)
      ..writeByte(2)
      ..write(obj.verse)
      ..writeByte(3)
      ..write(obj.slok)
      ..writeByte(4)
      ..write(obj.transliteration)
      ..writeByte(5)
      ..write(obj.translations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeetaSlokModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
