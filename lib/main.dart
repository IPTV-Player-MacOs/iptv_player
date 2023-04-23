import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/router/router.dart';
import 'package:iptv_player/service/collections/all_schemas.dart';
import 'package:isar/isar.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';

import 'about/about_window.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(allSchemas, directory: dir.path);

  if (args.firstOrNull == 'multi_window') {
    final windowId = int.parse(args[1]);
    final arguments = args[2].isEmpty
        ? const {}
        : jsonDecode(args[2]) as Map<String, dynamic>;
    runApp(
      ProviderScope(
        child: AboutWindow(
          windowController: WindowController.fromWindowId(windowId),
          args: arguments,
        ),
      ),
    );
  } else {
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
  }

  @override
  Widget build(BuildContext context) {
    return MacosApp.router(
      routerConfig: router,
      title: 'iptv_player',
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: material.ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
