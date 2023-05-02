import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:iptv_player/home/views/channels/channels_page.dart';
import 'package:iptv_player/home/views/movies/movie_page.dart';
import 'package:iptv_player/home/views/series/series_page.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:macos_ui/macos_ui.dart';

import '../provider/isar/m3u_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _categoryIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(clearDownloadAndPersistActivePlaylistItemsProvider()).when(
          data: (activeServer) {
            var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
            return MacosWindow(
              sidebar: Sidebar(
                minWidth: 200,
                top: Row(
                  children: [
                    MacosBackButton(
                      onPressed: () => context.pop(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Back",
                      style: MacosTheme.of(context).typography.headline,
                    ),
                  ],
                ),
                bottom: Column(
                  children: [
                    ref.watch(activeIptvServerProvider).when(
                          data: (data) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Active Server: ${data?.name}",
                                  style: MacosTheme.of(context)
                                      .typography
                                      .headline,
                                ),
                                Text(
                                    "Last Sync at: ${inputFormat.format(data!.lastSync!)}",
                                    style: MacosTheme.of(context)
                                        .typography
                                        .subheadline),
                              ],
                            );
                          },
                          error: (_, __) => const Text("Error"),
                          loading: () => Container(),
                        ),
                    const SizedBox(
                      height: 5,
                    ),
                    MacosIconButton(
                      icon: const Icon(
                        CupertinoIcons.refresh,
                        size: 15,
                      ),
                      boxConstraints:
                          BoxConstraints.tight(const Size.square(30)),
                      shape: BoxShape.circle,
                      disabledColor: CupertinoColors.lightBackgroundGray,
                      onPressed: () async {
                        ref
                            .read(isUpdatingActiveIptvServerProvider.notifier)
                            .toggle();
                        await ref
                            .read(iptvServerServiceProvider)
                            .refreshServerItems(forced: true);
                        ref
                            .read(isUpdatingActiveIptvServerProvider.notifier)
                            .toggle();
                      },
                    ),
                  ],
                ),
                builder: (context, scrollController) {
                  return SidebarItems(
                    scrollController: scrollController,
                    currentIndex: _categoryIndex,
                    onChanged: (categoryIndex) {
                      setState(() => _categoryIndex = categoryIndex);
                    },
                    items: const [
                      SidebarItem(
                        leading: MacosIcon(CupertinoIcons.tv),
                        label: Text('Channels'),
                      ),
                      SidebarItem(
                        leading: MacosIcon(CupertinoIcons.film),
                        label: Text('Movies'),
                      ),
                      SidebarItem(
                        leading: MacosIcon(CupertinoIcons.film_fill),
                        label: Text('Series'),
                      ),
                    ],
                  );
                },
              ),
              child: IndexedStack(
                index: _categoryIndex,
                children: const [
                  ChannelsPage(),
                  MoviesPage(),
                  SeriesPage(),
                  Center(
                    child: Text('Home'),
                  ),
                ],
              ),
            );
          },
          error: (error, __) {
            print(error);
            return const Text("Error");
          },
          loading: () => MacosScaffold(
            children: [
              ContentArea(
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Downloading and reading playlist..."),
                        ProgressCircle(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
  }
}
