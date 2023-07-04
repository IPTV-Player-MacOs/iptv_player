import 'package:flutter/cupertino.dart';
import 'package:iptv_player/shared/macos_form_text_field.dart';
import 'package:macos_ui/macos_ui.dart';

import '../form/manage_iptv_server_form_state.dart';
import '../form/name_input.dart';
import '../form/url_input.dart';

class MacOSMangeIptvServerWidget extends StatelessWidget {
  const MacOSMangeIptvServerWidget({
    super.key,
    required this.formKey,
    required this.state,
    required this.nameController,
    required this.urlController,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final ManageIptvServerFormState state;
  final TextEditingController nameController;
  final TextEditingController urlController;
  final Future<void> Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('Create new IPTV-Server'),
        titleWidth: 200,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Center(
              child: SizedBox(
                width: 400,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MacosIcon(
                        CupertinoIcons.add,
                        size: 90,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text('Add URL for IPTV playlist (.m3u8 or .ts)'),
                      const SizedBox(
                        height: 10,
                      ),
                      MacOsFormTextField(
                        controller: nameController,
                        placeholder: 'Name',
                        showError: state.name.isPure ||
                            (!state.name.isPure && state.name.isValid),
                        errorText: state.name.displayError?.text(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MacOsFormTextField(
                        controller: urlController,
                        placeholder: 'URL',
                        showError: state.url.isPure ||
                            (!state.url.isPure && state.url.isValid),
                        errorText: state.url.displayError?.text(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MacosIconButton(
                        key: const Key('submit_button'),
                        icon: Icon(
                          CupertinoIcons.arrow_right_circle_fill,
                          color: state.isNotValid
                              ? CupertinoColors.inactiveGray
                              : null,
                          size: 30,
                        ),
                        boxConstraints:
                            BoxConstraints.tight(const Size.square(60)),
                        shape: BoxShape.circle,
                        disabledColor: CupertinoColors.lightBackgroundGray,
                        onPressed: state.isValid ? () => onSubmit() : null,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
