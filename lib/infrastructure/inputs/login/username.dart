import 'package:formz/formz.dart';

// Define input validation errors
enum LUsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class LUsername extends FormzInput<String, LUsernameError> {
  // Call super.pure to represent an unmodified form input.
  const LUsername.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const LUsername.dirty(String value) : super.dirty(value);

  String? get getErrorMessage {
    if (isValid || isPure) return null;

    if (displayError == LUsernameError.empty) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  LUsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return LUsernameError.empty;

    return null;
  }
}
