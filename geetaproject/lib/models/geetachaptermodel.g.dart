// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geetachaptermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeetaChapterModelAdapter extends TypeAdapter<GeetaChapterModel> {
  @override
  final int typeId = 2;

  @override
  GeetaChapterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeetaChapterModel(
      chapterNumber: fields[0] as int?,
      versesCount: fields[1] as int?,
      name: fields[2] as String?,
      translation: fields[3] as String?,
      transliteration: fields[4] as String?,
      meaning: fields[5] as Meaning?,
      summary: fields[6] as Meaning?,
    );
  }

  @override
  void write(BinaryWriter writer, GeetaChapterModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.chapterNumber)
      ..writeByte(1)
      ..write(obj.versesCount)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.translation)
      ..writeByte(4)
      ..write(obj.transliteration)
      ..writeByte(5)
      ..write(obj.meaning)
      ..writeByte(6)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeetaChapterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeaningAdapter extends TypeAdapter<Meaning> {
  @override
  final int typeId = 3;

  @override
  Meaning read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meaning(
      en: fields[0] as String?,
      hi: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Meaning obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.en)
      ..writeByte(1)
      ..write(obj.hi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeaningAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
