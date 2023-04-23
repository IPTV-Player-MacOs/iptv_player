import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:macos_ui/macos_ui.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem(this.movie, {required this.height, super.key});

  final M3UItem movie;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: movie.attributes?.tvgLogo ?? "",
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
            movie.title ?? "",
            style: MacosTheme.of(context).typography.body,
          ),
        )
      ],
    );
  }
}
