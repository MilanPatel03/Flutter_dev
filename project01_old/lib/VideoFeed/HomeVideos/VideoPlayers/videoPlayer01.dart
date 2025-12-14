import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late YoutubePlayerController _youtubePlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  final int _currentIndex = 0;
  bool _isYouTube = false;

  final List<Map<String, dynamic>> _videos = [
    {'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', 'isYouTube': false},
    {'url': 'https://www.youtube.com/watch?v=5HU2UJjtQ-c', 'isYouTube': true},
    {'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', 'isYouTube': false},
    {'url': 'https://www.youtube.com/watch?v=Ok0aT6cwTGA', 'isYouTube': true},
  ];

  @override
  void initState() {
    super.initState();
    _loadVideo(_currentIndex);
  }

  void _loadVideo(int index) {
    setState(() {
      _isYouTube = _videos[index]['isYouTube'];

      if (_isYouTube) {
        // Load YouTube video
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(_videos[index]['url'])!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            controlsVisibleAtStart: true,
          ),
        );
      } else {
        // Load web video
        _videoPlayerController = VideoPlayerController.network(_videos[index]['url']);
        _initializeVideoPlayerFuture = _videoPlayerController.initialize();
      }
    });
  }

  @override
  void dispose() {
    if (_isYouTube) {
      _youtubePlayerController.dispose();
    } else {
      _videoPlayerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple Video Players')),
      body: Column(
        children: [
          _isYouTube
              ? YoutubePlayer(
            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
          )
              : FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_videos.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    _loadVideo(index);
                  },
                  child: Text('Video ${index + 1}'),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: _isYouTube
          ? null
          : Center(
            child: FloatingActionButton(
                    onPressed: () {
            setState(() {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();
              } else {
                _videoPlayerController.play();
              }
            });
                    },
                    child: Icon(
            _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
          ),
    );
  }
}
