import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/views/home_page.dart';
import 'package:macos_ui/macos_ui.dart';

import '../provider/isar/m3u_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final downloadAndPersistActivePlaylistItems$ =
        ref.watch(downloadAndPersistActivePlaylistItemsProvider);
    return PlatformMenuBar(
      menus: [
        PlatformMenu(
          label: 'IptvPlayer',
          menus: [
            PlatformMenuItem(
              label: 'About',
              onSelected: () async {
                final window = await DesktopMultiWindow.createWindow(jsonEncode(
                  {
                    'args1': 'About iptv_player',
                    'args2': 500,
                    'args3': true,
                  },
                ));
                debugPrint('$window');
                window
                  ..setFrame(const Offset(0, 0) & const Size(350, 350))
                  ..center()
                  ..setTitle('About iptv_player')
                  ..show();
              },
            ),
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.quit,
            ),
          ],
        ),
      ],
      child: downloadAndPersistActivePlaylistItems$.map(
        data: (_) => MacosWindow(
          titleBar: TitleBar(
            title: Text("Active Server"),
          ),
          sidebar: Sidebar(
            minWidth: 200,
            builder: (context, scrollController) {
              return SidebarItems(
                currentIndex: _pageIndex,
                onChanged: (index) {
                  setState(() => _pageIndex = index);
                },
                items: const [
                  SidebarItem(
                    leading: MacosIcon(CupertinoIcons.home),
                    label: Text('Home'),
                  ),
                  SidebarItem(
                    leading: MacosIcon(CupertinoIcons.search),
                    label: Text('Groups'),
                  ),
                  SidebarItem(
                    leading: MacosIcon(CupertinoIcons.search),
                    label: Text('Series'),
                    //Filter by /series/ im Link
                  ),
                  SidebarItem(
                    leading: MacosIcon(CupertinoIcons.search),
                    label: Text('Movies'),
                    //Filter by /movie/ im Link
                  ),
                ],
              );
            },
          ),
          child: IndexedStack(
            index: _pageIndex,
            children: const [
              HomePage(),
              Center(
                child: Text('Home'),
              ),
            ],
          ),
        ),
        error: (_) => const Text("Error"),
        loading: (_) => MacosScaffold(children: [
          ContentArea(
            builder: (BuildContext context, ScrollController scrollController) {
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
        ]),
      ),
    );
  }
}
