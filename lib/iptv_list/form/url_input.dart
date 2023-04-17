import 'package:formz/formz.dart';

enum UrlInputError { invalid, empty }

extension UrlInputErrorText on UrlInputError {
  String text() {
    switch (this) {
      case UrlInputError.invalid:
        return 'Please ensure the url entered is valid';
      case UrlInputError.empty:
        return 'Please enter a value for an URL.';
    }
  }
}

class UrlInput extends FormzInput<String, UrlInputError> {
  const UrlInput.pure({String? value = ''}) : super.pure(value ?? '');

  const UrlInput.dirty({String value = ''}) : super.dirty(value);

  static final _urlInputRegExp = RegExp(
    r'(https?://(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.\S{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.\S{2,}|https?://(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.\S{2,})',
  );

  @override
  UrlInputError? validator(String value) {
    if (value.isEmpty) {
      return UrlInputError.empty;
    }
    return _urlInputRegExp.hasMatch(value) ? null : UrlInputError.invalid;
  }
}
