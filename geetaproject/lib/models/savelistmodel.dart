import 'package:hive/hive.dart';

part 'savelistmodel.g.dart';

@HiveType(typeId: 4)
class SavelistModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<Map<String, int>> sloks; // Stores chapter and slok numbers

  SavelistModel({
    required this.name,
    required this.sloks,
  });

  factory SavelistModel.fromJson(Map<String, dynamic> json) {
    return SavelistModel(
      name: json['name'] as String,
      sloks: (json['sloks'] as List<dynamic>).cast<Map<String, int>>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sloks': sloks,
    };
  }
}