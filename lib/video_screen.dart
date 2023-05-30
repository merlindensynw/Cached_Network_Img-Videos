import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: const [
        Video1(
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        ),
        Video1(
          url:
              'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4',
        ),
        Video1(
          url: 'https://www.fluttercampus.com/video.mp4',
        ),
        Video1(
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        ),
        Video1(
          url:
              'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4',
        ),
      ],
    );
  }
}

class Video1 extends StatefulWidget {
  const Video1({super.key, required this.url});

  final String url;

  @override
  Video1State createState() => Video1State();
}

class Video1State extends State<Video1> {
  late VideoPlayerController videoPlayerController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  @override
  Future<void> initializeVideo() async {
    setState(() {
      loading = true;
    });
    var file = await DefaultCacheManager().getSingleFile(widget.url);

    videoPlayerController = VideoPlayerController.file(file);

    videoPlayerController.addListener(() {
      setState(() {});
    });
    videoPlayerController.setLooping(true);
    videoPlayerController.initialize();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Video Player')),
        body: loading
            ? CircularProgressIndicator()
            : Container(
                height: 600,
                width: 600,
                child: AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController),
                ),
              ),
        floatingActionButton: loading?null:FloatingActionButton(
          onPressed: () {
            setState(() {
              videoPlayerController.value.isPlaying
                  ? videoPlayerController.pause()
                  : videoPlayerController.play();
            });
          },
          child: Icon(
            videoPlayerController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
