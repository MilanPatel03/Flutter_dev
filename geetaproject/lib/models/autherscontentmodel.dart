import 'package:hive/hive.dart';

part 'autherscontentmodel.g.dart';

@HiveType(typeId: 1)
class AuthorContent extends HiveObject{
  @HiveField(0)
  final String? author;
  @HiveField(1)
  final String? et;
  @HiveField(2)
  final String? ht;
  @HiveField(3)
  final String? ec;
  @HiveField(4)
  final String? hc;
  @HiveField(5)
  final String? sc;

  AuthorContent({required this.author, this.et, this.ht, this.ec, this.hc, this.sc});

  factory AuthorContent.fromJson(Map<String, dynamic> json) {
    return AuthorContent(
      author: json['author'],
      et: json['et'],
      ht: json['ht'],
      ec: json['ec'],
      hc: json['hc'],
      sc: json['sc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'et': et,
      'ht': ht,
      'ec': ec,
      'hc': hc,
      'sc': sc,
    };
  }
}
