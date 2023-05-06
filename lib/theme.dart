import 'package:flutter/material.dart';
import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/theme/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  set(ThemeMode themeMode) {
    state = themeMode;
  }

  setAndPersistThemeMode(ThemeMode themeMode) {
    final isar = ref.watch(getIsarProvider).isar;
    isar.writeTxn(
        () => isar.themeCollections.put(ThemeCollection(1, themeMode)));
    set(themeMode);
  }
}
