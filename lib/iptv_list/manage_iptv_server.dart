import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/iptv_list/macOS/macos_mange_iptv_server_widget.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:platform_builder/platform_builder.dart';

import '../service/collections/iptv_server/iptv_server.dart';
import 'form/manage_iptv_server_form_state.dart';
import 'form/name_input.dart';
import 'form/url_input.dart';

class ManageIptvServerItem extends ConsumerStatefulWidget {
  const ManageIptvServerItem({
    this.iptvServer,
    super.key,
  });

  final IptvServer? iptvServer;

  @override
  ConsumerState createState() => _ManageIptvServerItemState();
}

class _ManageIptvServerItemState extends ConsumerState<ManageIptvServerItem> {
  final _formKey = GlobalKey<FormState>();
  late ManageIptvServerFormState _state;
  late final TextEditingController _nameController;
  late final TextEditingController _urlController;

  void _onEmailChanged() {
    setState(() {
      _state =
          _state.copyWith(name: NameInput.dirty(value: _nameController.text));
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _state = _state.copyWith(
        url: UrlInput.dirty(value: _urlController.text),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _state = _state.copyWith(status: FormzSubmissionStatus.inProgress);
    });

    try {
      if (_state.id != null) {
        await ref.read(iptvServerServiceProvider).put(
              IptvServer(_state.name.value, _state.url.value, id: _state.id!),
            );
      } else {
        await ref.read(iptvServerServiceProvider).put(
              IptvServer(_state.name.value, _state.url.value),
            );
      }
      _state = _state.copyWith(status: FormzSubmissionStatus.success);
    } catch (_) {
      _state = _state.copyWith(status: FormzSubmissionStatus.failure);
    }

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();

    context.pop();

    if (_state.status.isSuccess) _resetForm();
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _urlController.clear();
    setState(() => _state = ManageIptvServerFormState());
  }

  @override
  void initState() {
    super.initState();
    final iptvServer = widget.iptvServer;
    _state = ManageIptvServerFormState(
      id: iptvServer?.id,
      name: NameInput.pure(value: iptvServer?.name),
      url: UrlInput.pure(value: iptvServer?.url),
    );
    _nameController = TextEditingController(text: _state.name.value)
      ..addListener(_onEmailChanged);
    _urlController = TextEditingController(text: _state.url.value)
      ..addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      macOSBuilder: (context) => MacOSMangeIptvServerWidget(
        formKey: _formKey,
        state: _state,
        nameController: _nameController,
        urlController: _urlController,
        onSubmit: _onSubmit,
      ),
      windowsBuilder: (context) => MacOSMangeIptvServerWidget(
        formKey: _formKey,
        state: _state,
        nameController: _nameController,
        urlController: _urlController,
        onSubmit: _onSubmit,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    super.dispose();
  }
}
