// ====== MODELS (Add this Group model to your models file) ======
import '../../../Commons/constants.dart';

class Group {
  final String id;
  final String name;
  final DestinationType destinationType;
  final String description;
  final String imageUrl;
  final int membersCount;
  final List<String> tags;
  final List<String> placeIds; // references to Place.id

  Group({
    required this.id,
    required this.name,
    required this.destinationType,
    required this.description,
    required this.imageUrl,
    required this.membersCount,
    required this.tags,
    required this.placeIds,
  });
}