import 'package:formz/formz.dart';

// Define input validation errors
enum CedulaError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Cedula extends FormzInput<String, CedulaError> {
  // Call super.pure to represent an unmodified form input.
  const Cedula.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Cedula.dirty( String value ) : super.dirty(value);

  String? get getErrorMessage {

    if( isValid || isPure ) return null;

    if( displayError == CedulaError.empty ) return 'El campo es requerido';
    if( displayError == CedulaError.length ) return 'Minimo 5 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CedulaError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return CedulaError.empty;
    if (value.length > 10 || value.length < 5) return CedulaError.length;

    return null;
  }
}
