import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_value_provider.g.dart';

@riverpod
class ChannelSearchValue extends _$ChannelSearchValue {
  @override
  String build() {
    return "";
  }

  void setValue(String value) {
    state = value;
  }
}

@riverpod
class MovieSearchValue extends _$MovieSearchValue {
  @override
  String build() {
    return "";
  }

  void setValue(String value) {
    state = value;
  }
}
 
@riverpod
class SeriesSearchValue extends _$SeriesSearchValue {
  @override
  String build() {
    return "";
  }

  void setValue(String value) {
    state = value;
  }
}
