import 'package:formz/formz.dart';

// Define input validation errors
enum LPasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class LPassword extends FormzInput<String, LPasswordError> {
  // Call super.pure to represent an unmodified form input.
  const LPassword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const LPassword.dirty( String value ) : super.dirty(value);

  String? get getErrorMessage {

    if( isValid || isPure ) return null;

    if( displayError == LPasswordError.empty ) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  LPasswordError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return LPasswordError.empty;

    return null;
  }
}
