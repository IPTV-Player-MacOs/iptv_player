import 'package:http/http.dart' as http;
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:m3u_parser_nullsafe/m3u_parser_nullsafe.dart';

import '../provider/isar/isar_provider.dart';
import 'collections/m3u/m3u_item.dart';

class M3uParseService {
  M3uParseService(this.isarService);

  final IsarService isarService;

  Future<IptvServer> downloadAndPersist(IptvServer iptvServer) async {
    final playlist = await download(iptvServer.url);
    persist(playlist, iptvServer);
    return iptvServer;
  }

  Future<M3uList> download(String link) async {
    Uri url = Uri.parse(link);
    var response = await http.get(url);
    return M3uList.load(response.body);
  }

  void persist(M3uList playlist, IptvServer iptvServer) {
    isarService.isar.writeTxnSync(() {
      isarService.isar.m3UItems.putAllSync(
        playlist.items.map((e) {
          var timeShift = e.attributes['timeshift'];
          var tvgId = e.attributes['tvg-id'];
          var tvgName = e.attributes['tvg-name'];
          var tvgLogo = e.attributes['tvg-logo'];
          var groupTitle = e.attributes['group-title'];
          String? season;
          String? episode;
          String? series;
          M3UType category = M3UType.channel;
          if (e.link.contains('movie')) {
            category = M3UType.movie;
          } else if (e.link.contains('series')) {
            category = M3UType.series;

            RegExp exp = RegExp(r"S(\d+)E(\d+)");
            Iterable<Match> matches = exp.allMatches(e.title);
            for (Match m in matches) {
              season = m.group(1);
              episode = m.group(2);
            }

            RegExp exp2 = RegExp(r"\s*S\d+E\d+");
            series = e.title.replaceAll(exp2, "");
          }

          return M3UItem(
            e.link,
            e.duration,
            e.title,
            series,
            e.groupTitle,
            Attributes(
                timeShift: timeShift,
                tvgId: tvgId,
                tvgName: tvgName,
                tvgLogo: tvgLogo,
                groupTitle: groupTitle),
            category,
            season,
            episode,
          )..iptvServer.value = iptvServer;
        }).toList(),
        saveLinks: true,
      ); // insert & update
    });
  }
}
