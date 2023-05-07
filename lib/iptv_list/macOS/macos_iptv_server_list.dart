import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/theme.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../provider/isar/iptv_server_provider.dart';
import '../../provider/isar/m3u_provider.dart';
import '../manage_iptv_server.dart';

class MacOSIptvServerList extends ConsumerWidget {
  const MacOSIptvServerList({super.key});

  String obscureUrl(String url) {
    RegExp? exp = RegExp(r"^(https?://[^/]+)");
    RegExpMatch? match = exp.firstMatch(url);
    if (match != null) {
      return "${match.group(1)}********";
    } else {
      return url;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverItems$ = ref.watch(iptvServerItemsProvider);
    final currentTheme = ref.watch(appThemeProvider);
    return MacosScaffold(
      toolBar: ToolBar(
        title: const Text('Playlists'),
        actions: [
          ToolBarIconButton(
            label: "Add",
            icon: const MacosIcon(
              CupertinoIcons.add_circled,
            ),
            onPressed: () => showMacosSheet(
              barrierDismissible: true,
              context: context,
              builder: (_) => const MacosSheet(child: ManageIptvServerItem()),
            ),
            showLabel: true,
          ),
          ToolBarIconButton(
            label: currentTheme == ThemeMode.light ? "Dark Mode" : "Light Mode",
            icon: const MacosIcon(
              CupertinoIcons.color_filter,
            ),
            onPressed: () => ref
                .read(appThemeProvider.notifier)
                .setAndPersistThemeMode(currentTheme == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light),
            showLabel: true,
          ),
        ],
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return serverItems$.map(
              data: (data) {
                final serverItems = data.value;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Playlists (${serverItems.length})",
                        style: MacosTheme.of(context).typography.title1,
                      ),
                      const Divider(
                        thickness: 2,
                        color: CupertinoColors.lightBackgroundGray,
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          itemBuilder: (context, index) {
                            final server = serverItems[index];
                            return Column(
                              children: [
                                MacosListTile(
                                  leading: const Icon(
                                    CupertinoIcons.list_bullet_below_rectangle,
                                    size: 40,
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            server.name,
                                            style: MacosTheme.of(context)
                                                .typography
                                                .title2,
                                          ),
                                          Text(
                                            obscureUrl(server.url),
                                            style: MacosTheme.of(context)
                                                .typography
                                                .caption1,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          MacosIconButton(
                                            icon: const Icon(
                                              CupertinoIcons.pencil,
                                              size: 40,
                                            ),
                                            boxConstraints:
                                                BoxConstraints.tight(
                                                    const Size.square(40)),
                                            shape: BoxShape.circle,
                                            onPressed: () => {
                                              showMacosSheet(
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (_) => MacosSheet(
                                                    child: ManageIptvServerItem(
                                                  iptvServer: server,
                                                )),
                                              ),
                                            },
                                          ),
                                          MacosIconButton(
                                            icon: const Icon(
                                              CupertinoIcons.delete,
                                              size: 40,
                                            ),
                                            boxConstraints:
                                                BoxConstraints.tight(
                                                    const Size.square(40)),
                                            shape: BoxShape.circle,
                                            onPressed: () => {
                                              ref
                                                  .read(
                                                      iptvServerServiceProvider)
                                                  .delete(server.id)
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onClick: () {
                                    ref
                                        .read(m3uServiceProvider)
                                        .activeIptvServer = server;
                                    context.go('/main');
                                  },
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: CupertinoColors.lightBackgroundGray,
                                ),
                              ],
                            );
                          },
                          itemCount: serverItems.length,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error) {
                print(error);
                return const Center(
                  child: Text('Error...'),
                );
              },
              loading: (_) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
