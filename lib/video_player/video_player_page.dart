import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video_controls/widgets/media_kit_player.dart';

class VideoPlayerPage extends ConsumerStatefulWidget {
  const VideoPlayerPage({
    required this.videoUrl,
    super.key,
  });

  final String videoUrl;

  @override
  ConsumerState<VideoPlayerPage> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayerPage> {
  final Player player = Player(
    configuration: const PlayerConfiguration(
      logLevel: MPVLogLevel.warn,
    ),
  );

  MediaKitController? mediaKitController;
  VideoController? videoController;

  @override
  void initState() {
    super.initState();
    mediaKitController = MediaKitController(
      player: player,
      autoPlay: true,
      looping: true,
    );
    Future.microtask(() async {
      videoController = await VideoController.create(player);
      await player.open(
        Media(
          widget.videoUrl,
        ),
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    Future.microtask(() async {
      debugPrint('Disposing [Player] and [VideoController]...');
      await player.dispose();
      await videoController?.dispose();
      mediaKitController?.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      home: MacosWindow(
        child: MacosScaffold(
          children: [
            ContentArea(
              builder: (context, scrollController) {
                return Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 8.0,
                                  clipBehavior: Clip.antiAlias,
                                  margin: const EdgeInsets.all(32.0),
                                  child: MediaKitControls(
                                    controller: mediaKitController!,
                                    video: Video(controller: videoController),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
