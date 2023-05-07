import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:macos_ui/macos_ui.dart';

class M3uListItem extends StatefulWidget {
  const M3uListItem(this.m3uItem, {required this.height, super.key});

  final M3UItem m3uItem;
  final double height;

  @override
  State<M3uListItem> createState() => _M3uListItemState();
}

class _M3uListItemState extends State<M3uListItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        setState(() => isHovering = false);
      },
      onHover: (PointerHoverEvent hovering) {
        setState(() => isHovering = true);
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final windowIds = await DesktopMultiWindow.getAllSubWindowIds();
          if (windowIds.isNotEmpty) {
            for (var element in windowIds) {
              await WindowController.fromWindowId(element).close();
            }
          }
          final window = await DesktopMultiWindow.createWindow(jsonEncode(
            {
              'args0': 'player',
              'link': widget.m3uItem.link,
              'isLive': widget.m3uItem.name == M3UType.channel,
            },
          ));
          debugPrint('$window');
          window
            ..setFrame(const Offset(0, 0) & const Size(960, 540))
            ..center()
            ..setTitle(widget.m3uItem.title ?? "Stream")
            ..show();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isHovering
                ? MacosTheme.of(context).dividerColor
                : MacosTheme.of(context).canvasColor,
          ),
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: FastCachedImage(
                  fit: BoxFit.fitHeight,
                  url: widget.m3uItem.attributes?.tvgLogo ?? "",
                  loadingBuilder: (context, progress) {
                    return Center(
                      child: ProgressBar(
                        value: progress.progressPercentage.value,
                      ),
                    );
                  },
                  errorBuilder: (context, exception, stacktrace) => Image.asset(
                    "assets/images/no_image_available.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.m3uItem.title ?? "",
                style: MacosTheme.of(context).typography.body,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
