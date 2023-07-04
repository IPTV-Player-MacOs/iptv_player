import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:window_manager/window_manager.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    required this.videoUrl,
    required this.isLive,
    required this.windowController,
    required this.args,
    super.key,
  });

  final String videoUrl;
  final bool isLive;
  final WindowController windowController;
  final Map? args;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with WindowListener {
  final Player player = Player(
    configuration: const PlayerConfiguration(
      logLevel: MPVLogLevel.warn,
    ),
  );
  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    videoController = VideoController(player);
    Future.microtask(() async {
      await player.open(
        Media(widget.videoUrl),
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    Future.microtask(() async {
      debugPrint('Disposing [Player] and [VideoController]...');
      await player.dispose();
    });
    super.dispose();
  }

  @override
  void onWindowClose() async {
    dispose();
    super.onWindowClose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Video(controller: videoController),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
