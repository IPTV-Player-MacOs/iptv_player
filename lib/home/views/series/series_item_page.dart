import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../widgets/movie_list_item.dart';

class SeriesItemPage extends ConsumerStatefulWidget {
  const SeriesItemPage({
    required this.series,
    required this.season,
    super.key,
  });

  final String series;
  final String season;

  @override
  ConsumerState<SeriesItemPage> createState() => _SeriesItemPageState();
}

class _SeriesItemPageState extends ConsumerState<SeriesItemPage> {
  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1500) {
      return 5;
    } else if (width > 1000) {
      return 4;
    } else if (width > 700) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final seriesProvider = ref.watch(findAllItemsOfSeriesAndSeasonProvider(
      series: widget.series,
      season: widget.season,
    ));

    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(widget.series),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            final isUpdating = ref.watch(isUpdatingActiveIptvServerProvider);
            if (!isUpdating) {
              return seriesProvider.map(
                data: (moviesObj) {
                  final movies = moviesObj.value;
                  if (movies.isNotEmpty) {
                    var size = MediaQuery.of(context).size;
                    final double itemHeight = (size.height) / 1.5;
                    final double itemWidth = size.width / 2;
                    return GridView.builder(
                      controller: scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: calculateCrossAxisCount(context),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemBuilder: (_, index) => M3uListItem(
                        movies[index],
                        height: itemHeight,
                      ),
                      itemCount: movies.length,
                      padding: const EdgeInsets.all(10),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("No series found"),
                        ],
                      ),
                    );
                  }
                },
                error: (error) => Container(),
                loading: (_) => const Center(
                  child: ProgressCircle(),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Downloading and reading playlist..."),
                    ProgressCircle(),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
