// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autherscontentmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorContentAdapter extends TypeAdapter<AuthorContent> {
  @override
  final int typeId = 1;

  @override
  AuthorContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorContent(
      author: fields[0] as String?,
      et: fields[1] as String?,
      ht: fields[2] as String?,
      ec: fields[3] as String?,
      hc: fields[4] as String?,
      sc: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthorContent obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.et)
      ..writeByte(2)
      ..write(obj.ht)
      ..writeByte(3)
      ..write(obj.ec)
      ..writeByte(4)
      ..write(obj.hc)
      ..writeByte(5)
      ..write(obj.sc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
