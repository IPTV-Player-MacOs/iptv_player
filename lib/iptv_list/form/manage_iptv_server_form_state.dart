import 'package:formz/formz.dart';
import 'package:iptv_player/iptv_list/form/name_input.dart';
import 'package:iptv_player/iptv_list/form/url_input.dart';
import 'package:isar/isar.dart';

class ManageIptvServerFormState with FormzMixin {
  ManageIptvServerFormState({
    this.id,
    this.name = const NameInput.pure(),
    this.url = const UrlInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Id? id;
  final NameInput name;
  final UrlInput url;
  final FormzSubmissionStatus status;

  ManageIptvServerFormState copyWith({
    Id? id,
    NameInput? name,
    UrlInput? url,
    FormzSubmissionStatus? status,
  }) {
    return ManageIptvServerFormState(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput> get inputs => [name, url];
}
