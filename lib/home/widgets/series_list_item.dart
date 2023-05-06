import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:macos_ui/macos_ui.dart';

class SeriesListItem extends StatefulWidget {
  const SeriesListItem(this.m3uItem, {required this.height, super.key});

  final M3UItem m3uItem;
  final double height;

  @override
  State<SeriesListItem> createState() => _SeriesListItemState();
}

class _SeriesListItemState extends State<SeriesListItem> {
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
          context.go("/main/series", extra: widget.m3uItem);
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
                  url: widget.m3uItem.attributes?.tvgLogo ??
                      "https://placehold.co/600x400",
                  loadingBuilder: (context, progress) {
                    return Center(
                      child: ProgressBar(
                        value: progress.progressPercentage.value,
                      ),
                    );
                  },
                  errorBuilder: (context, exception, stacktrace) =>
                      const Icon(CupertinoIcons.exclamationmark_octagon),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.m3uItem.series}",
                style: MacosTheme.of(context).typography.body,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
