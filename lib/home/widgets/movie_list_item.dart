import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:macos_ui/macos_ui.dart';

class M3uListItem extends StatelessWidget {
  const M3uListItem(this.m3uItem, {required this.height, super.key});

  final M3UItem m3uItem;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl:
                m3uItem.attributes?.tvgLogo ?? "https://placehold.co/600x400",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: ProgressBar(value: downloadProgress.progress ?? 0),
            ),
            errorWidget: (context, url, error) =>
                const Icon(CupertinoIcons.exclamationmark_octagon),
          ),
        ),
        SizedBox(
          height: 30,
          child: Text(
            m3uItem.title ?? "",
            style: MacosTheme.of(context).typography.body,
          ),
        )
      ],
    );
  }
}