import 'package:go_router/go_router.dart';
import 'package:iptv_player/home/home_view.dart';
import 'package:iptv_player/home/views/series/series_season_page.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';

import '../iptv_list/iptv_server_list.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IptvServerList(),
      routes: [
        GoRoute(
            path: 'main',
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                path: 'series',
                builder: (context, state) {
                  M3UItem item = state.extra as M3UItem;
                  return SeriesSeasonPage(
                    series: item.series!,
                  );
                },
              ),
            ]),
      ],
    ),
  ],
);
