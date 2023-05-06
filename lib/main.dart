import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/router/router.dart';
import 'package:iptv_player/service/collections/all_schemas.dart';
import 'package:iptv_player/service/collections/theme/theme.dart';
import 'package:iptv_player/theme.dart';
import 'package:iptv_player/video_player/video_player.dart';
import 'package:isar/isar.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_builder/platform_builder.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await windowManager.ensureInitialized();

  Platform.init(supportedPlatforms: {Platforms.macOS, Platforms.windows});

  if (args.firstOrNull == 'multi_window') {
    final windowId = int.parse(args[1]);
    final arguments = args[2].isEmpty
        ? const {}
        : jsonDecode(args[2]) as Map<String, dynamic>;
    if (arguments.containsValue('player')) {
      final link = arguments['link'];
      final isLive = arguments['isLive'];
      runApp(
        ProviderScope(
          child: VideoPlayer(
            videoUrl: link,
            isLive: isLive,
            windowController: WindowController.fromWindowId(windowId),
            args: arguments,
          ),
        ),
      );
    }
  } else {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(allSchemas, directory: dir.path);

    await FastCachedImageConfig.init(
      subDir: dir.path,
      clearCacheAfter: const Duration(days: 15),
    );

    runApp(
      ProviderScope(
        child: App(
          isar: isar,
        ),
      ),
    );
  }
}

class App extends ConsumerStatefulWidget {
  const App({required this.isar, super.key});

  final Isar isar;

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    ref.read(getIsarProvider).init(widget.isar);
    final initialTheme = widget.isar.themeCollections.getSync(1) ??
        ThemeCollection(1, ThemeMode.system);
    Future(() => ref.read(appThemeProvider.notifier).set(initialTheme.mode));
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return PlatformBuilder(
      macOSBuilder: (context) => MacosApp.router(
        routerConfig: router,
        title: 'iptv_player',
        theme: MacosThemeData.light(),
        darkTheme: MacosThemeData.dark(),
        themeMode: theme,
        debugShowCheckedModeBanner: false,
      ),
      windowsBuilder: (context) => material.MaterialApp.router(
        routerConfig: router,
        title: 'iptv_player',
        theme: material.ThemeData.light(),
        darkTheme: material.ThemeData.dark(),
        themeMode: theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
