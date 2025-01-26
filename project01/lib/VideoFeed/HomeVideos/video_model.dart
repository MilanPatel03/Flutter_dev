class VideoModel {
  final String source;
  final String url;

  VideoModel({required this.source, required this.url});
}

final List<Map<String, String>> videoFeeds = [
  {'type': 'youtube', 'id': 'Fgi8Q9Puyqc'},  // Example YouTube video ID
  {'type': 'web', 'url': 'https://www.cnn.com/2024/08/22/world/video/5-things-dnc-covid-mount-fuji'},
  {'type': 'youtube', 'id': 'x5Hha6UglK4'},
  {'type': 'web', 'url': 'https://edition.cnn.com/2024/08/21/world/video/sunken-bayesian-superyacht-missing-bodies-recovery-nadeau-dgivid'},
];