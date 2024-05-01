import 'package:formz/formz.dart';

// Define input validation errors
enum ConfirmedPasswordError { empty, format, length, mismatch }

// Extend FormzInput and provide the input type and error type.
class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordError> {
  static final RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  // Call super.pure to represent an unmodified form input.
  const ConfirmedPassword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const ConfirmedPassword.dirty(String value) : super.dirty(value);

  String? get getErrorMessage {
    if (isValid || isPure) return null;

    if (displayError == ConfirmedPasswordError.empty) return 'El campo es requerido';
    if (displayError == ConfirmedPasswordError.length) return 'Minimo 8 caracteres';
    if (displayError == ConfirmedPasswordError.format) return '1 mayuscula, 1 numero y 1 caracter especial';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ConfirmedPasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)
      return ConfirmedPasswordError.empty;

    if (value.length < 8) return ConfirmedPasswordError.length;

    if (!passwordRegExp.hasMatch(value)) return ConfirmedPasswordError.format;

    return null;
  }
}
