import 'package:cutap/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

// Define input validation errors
enum ConfirmedPasswordError { empty, format, length, mismatch }

// Extend FormzInput and provide the input type and error type.
class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordError> {
  static final RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
  final Password original;

  const ConfirmedPassword.pure() : original = const Password.pure(), super.pure('');
  const ConfirmedPassword.dirty({required this.original, String value = ''}) : super.dirty(value);

  String? get getErrorMessage {
    if (isValid || isPure) return null;

    if (displayError == ConfirmedPasswordError.empty) return 'El campo es requerido';
    if (displayError == ConfirmedPasswordError.mismatch) return 'Las contraseñas no coinciden';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ConfirmedPasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return ConfirmedPasswordError.empty;

    if(value != original.value) return ConfirmedPasswordError.mismatch;

    return null;
  }
}
