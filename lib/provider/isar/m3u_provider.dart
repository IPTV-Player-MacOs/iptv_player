import 'package:iptv_player/service/m3u_parse_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/m3u_service.dart';
import 'isar_provider.dart';

part 'm3u_provider.g.dart';

@Riverpod(keepAlive: true)
M3uService m3uService(M3uServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uService(isar);
}

@Riverpod(keepAlive: true)
M3uParseService m3uParseService(M3uParseServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uParseService(isar);
}
