class Place {
  final String id;
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final int reviewsCount;
  final double rating;
  final List<String> tags;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.reviewsCount,
    required this.rating,
    required this.tags
  });
}