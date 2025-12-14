class NewsItem {
  final String id;
  final String title;
  final String source;
  final String imageUrl;
  final DateTime publishTime;
  final String url;

  NewsItem({
    required this.id,
    required this.title,
    required this.source,
    required this.imageUrl,
    required this.publishTime,
    required this.url
  });
}
