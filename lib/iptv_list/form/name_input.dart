import 'package:formz/formz.dart';

enum NameInputError { empty }

extension NameInputErrorText on NameInputError {
  String text() {
    switch (this) {
      case NameInputError.empty:
        return '''Please enter a value for a name.''';
    }
  }
}

class NameInput extends FormzInput<String, NameInputError> {
  const NameInput.pure({String? value = ''}) : super.pure(value ?? '');

  const NameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  NameInputError? validator(String value) {
    return value.isEmpty ? NameInputError.empty : null;
  }
}
