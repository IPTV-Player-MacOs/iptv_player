import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/provider/search_value_provider.dart';
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
  int _pageIndex = 0;
  String? _category;

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
    final channelProvider = ref.watch(
      findAllChannelsProvider(groupTitle: _category),
    );

    return MacosScaffold(
      toolBar: ToolBar(
        leading: MacosIconButton(
          icon: const MacosIcon(
            CupertinoIcons.sidebar_left,
          ),
          onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
        ),
        title: const Text('Channels'),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            final isUpdating = ref.watch(isUpdatingActiveIptvServerProvider);

            if (!isUpdating) {
              return MacosWindow(
                sidebar: Sidebar(
                  dragClosed: false,
                  minWidth: 200,
                  maxWidth: 200,
                  topOffset: 0,
                  top: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Categories"),
                  ),
                  builder: (context, scrollController) {
                    return ref.watch(findAllChannelGroupsProvider).when(
                          data: (data) => SidebarItems(
                            scrollController: scrollController,
                            currentIndex: _pageIndex,
                            onChanged: (index) {
                              setState(() {
                                if (index - 1 >= 0) {
                                  _category = data[index - 1].groupTitle;
                                } else {
                                  _category = null;
                                }
                                _pageIndex = index;
                              });
                            },
                            items: [
                              const SidebarItem(
                                label: Text("All"),
                              ),
                              for (var item in data)
                                SidebarItem(
                                  label: Flexible(
                                    child: Text("${item.groupTitle}"),
                                  ),
                                )
                            ],
                          ),
                          error: (error, stackTrace) => Container(),
                          loading: () => Container(),
                        );
                  },
                ),
                child: Column(
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
                      child: channelProvider.when(
                        data: (movies) {
                          if (movies.isNotEmpty) {
                            var size = MediaQuery.of(context).size;
                            final double itemHeight = (size.height) / 1.25;
                            final double itemWidth = size.width / 2;
                            return GridView.builder(
                              controller: scrollController,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    calculateCrossAxisCount(context),
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
                        error: (error, _) => Container(),
                        loading: () => const Center(
                          child: ProgressCircle(),
                        ),
                      ),
                    ),
                  ],
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
