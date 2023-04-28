import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/views/search_value_provider.dart';
import 'package:iptv_player/home/widgets/movie_list_item.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class ChannelsPage extends ConsumerStatefulWidget {
  const ChannelsPage({super.key});

  @override
  ConsumerState<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends ConsumerState<ChannelsPage> {
  late TextEditingController searchController;

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
    searchController = TextEditingController()
      ..addListener(
        () => ref
            .read(channelSearchValueProvider.notifier)
            .setValue(searchController.value.text),
      );
  }

  @override
  Widget build(BuildContext context) {
    final seriesProvider = ref.watch(
      findAllChannelsProvider,
    );

    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('Channels'),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            final isUpdating = ref.watch(isUpdatingActiveIptvServerProvider);
            if (!isUpdating) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MacosTextField(
                            controller: searchController,
                            prefix: const MacosIcon(CupertinoIcons.search),
                            placeholder: 'Search for a channel',
                            clearButtonMode: OverlayVisibilityMode.editing,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: seriesProvider.map(
                      data: (moviesObj) {
                        final movies = moviesObj.value;
                        if (movies.isNotEmpty) {
                          var size = MediaQuery.of(context).size;
                          final double itemHeight = (size.height) / 1.5;
                          final double itemWidth = size.width / 2;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                Text("No channels found"),
                              ],
                            ),
                          );
                        }
                      },
                      error: (error) => Container(),
                      loading: (_) => const Center(
                        child: ProgressCircle(),
                      ),
                    ),
                  ),
                ],
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
