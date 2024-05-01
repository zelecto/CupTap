import 'package:formz/formz.dart';

// Define input validation errors
enum ApellidosError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Apellidos extends FormzInput<String, ApellidosError> {
  // Call super.pure to represent an unmodified form input.
  const Apellidos.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Apellidos.dirty( String value ) : super.dirty(value);

  String? get getErrorMessage {

    if( isValid || isPure ) return null;

    if( displayError == ApellidosError.empty ) return 'El campo es requerido';
    if( displayError == ApellidosError.length ) return 'Minimo 3 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ApellidosError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return ApellidosError.empty;
    if (value.length < 3) return ApellidosError.length;

    return null;
  }
}
