import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/iptv_list/macOS/macos_iptv_server_list.dart';
import 'package:platform_builder/platform_builder.dart';

class IptvServerList extends ConsumerWidget {
  const IptvServerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformBuilder(
      macOSBuilder: (context) => const MacOSIptvServerList(),
      windowsBuilder: (context) => const MacOSIptvServerList(),
    );
  }
}
