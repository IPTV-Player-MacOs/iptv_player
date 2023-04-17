import 'package:go_router/go_router.dart';
import 'package:iptv_player/main.dart';

import '../iptv_list/iptv_server_list.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IptvServerList(),
      routes: [
        GoRoute(path: 'main', builder: (context, state) => const MainView()),
      ],
    ),
  ],
);
