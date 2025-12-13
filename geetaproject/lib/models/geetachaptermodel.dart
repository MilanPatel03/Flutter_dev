import 'package:hive/hive.dart';

part 'geetachaptermodel.g.dart';

@HiveType(typeId: 2)
class GeetaChapterModel extends HiveObject {
  @HiveField(0)
  int? chapterNumber;
  @HiveField(1)
  int? versesCount;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? translation;
  @HiveField(4)
  String? transliteration;
  @HiveField(5)
  Meaning? meaning;
  @HiveField(6)
  Meaning? summary;

  GeetaChapterModel({
    this.chapterNumber,
    this.versesCount,
    this.name,
    this.translation,
    this.transliteration,
    this.meaning,
    this.summary,
  });

  factory GeetaChapterModel.fromJson(Map<String, dynamic> json) {
    return GeetaChapterModel(
      chapterNumber: json['chapter_number'],
      versesCount: json['verses_count'],
      name: json['name']?.toString(),
      translation: json['translation']?.toString(),
      transliteration: json['transliteration']?.toString(),
      meaning: json['meaning'] != null ? Meaning.fromJson(json['meaning']) : null,
      summary: json['summary'] != null ? Meaning.fromJson(json['summary']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['chapter_number'] = chapterNumber;
    data['verses_count'] = versesCount;
    data['name'] = name;
    data['translation'] = translation;
    data['transliteration'] = transliteration;
    if (meaning != null) {
      data['meaning'] = meaning!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 3)
class Meaning extends HiveObject {
  @HiveField(0)
  String? en;
  @HiveField(1)
  String? hi;

  Meaning({this.en, this.hi});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      en: json['en']?.toString(),
      hi: json['hi']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['en'] = en;
    data['hi'] = hi;
    return data;
  }
}