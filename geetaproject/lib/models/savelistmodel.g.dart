// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savelistmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavelistModelAdapter extends TypeAdapter<SavelistModel> {
  @override
  final int typeId = 4;

  @override
  SavelistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavelistModel(
      name: fields[0] as String,
      sloks: (fields[1] as List)
          .map((dynamic e) => (e as Map).cast<String, int>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, SavelistModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.sloks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavelistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
