import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/views/series/series_item_page.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class SeriesSeasonPage extends ConsumerStatefulWidget {
  const SeriesSeasonPage({required this.series, super.key});

  final String series;

  @override
  ConsumerState<SeriesSeasonPage> createState() => _SeriesSeasonPage();
}

class _SeriesSeasonPage extends ConsumerState<SeriesSeasonPage> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(findAllSeasonsOfSeriesProvider(series: widget.series))
        .when(
          data: (items) {
            return MacosWindow(
              sidebar: Sidebar(
                minWidth: 200,
                builder: (context, scrollController) {
                  return SidebarItems(
                    scrollController: scrollController,
                    currentIndex: _pageIndex,
                    onChanged: (index) {
                      setState(() => _pageIndex = index);
                    },
                    items: [
                      for (var item in items)
                        SidebarItem(
                          label: Text("Season ${item.season}"),
                        )
                    ],
                  );
                },
              ),
              child: IndexedStack(
                index: _pageIndex,
                children: [
                  for (var item in items)
                    SeriesItemPage(
                      series: item.series!,
                      season: item.season!,
                    )
                ],
              ),
            );
          },
          error: (error, _) => Container(),
          loading: () => const Center(
            child: ProgressCircle(),
          ),
        );
  }
}
