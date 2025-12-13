import 'package:hive/hive.dart';
import 'autherscontentmodel.dart';

part 'geetaslokmodel.g.dart';

@HiveType(typeId: 0)
class GeetaSlokModel extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final int chapter;
  @HiveField(2)
  final int verse;
  @HiveField(3)
  final String? slok;
  @HiveField(4)
  final String? transliteration;
  @HiveField(5)
  final Map<String, AuthorContent> translations; // Updated type

  GeetaSlokModel({
    required this.id,
    required this.chapter,
    required this.verse,
    required this.slok,
    required this.transliteration,
    required this.translations,
  });

  factory GeetaSlokModel.fromJson(Map<String, dynamic> json) {
    return GeetaSlokModel(
      id: json['_id']?.toString(), // Convert to String or null
      chapter: json['chapter'] ?? 0, // Default to 0 if null
      verse: json['verse'] ?? 0, // Default to 0 if null
      slok: json['slok']?.toString(), // Convert to String or null
      transliteration: json['transliteration']?.toString(), // Convert to String or null
      translations: (json..removeWhere((k, v) => ['_id', 'chapter', 'verse', 'slok', 'transliteration'].contains(k)))
          .map((key, value) => MapEntry(key, AuthorContent.fromJson(value))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'chapter': chapter,
      'verse': verse,
      'slok': slok,
      'transliteration': transliteration,
      ...translations.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}