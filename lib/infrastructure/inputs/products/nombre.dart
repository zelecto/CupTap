import 'package:formz/formz.dart';

// Define input validation errors
enum NombreError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Nombre extends FormzInput<String, NombreError> {
  // Call super.pure to represent an unmodified form input.
  const Nombre.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Nombre.dirty( String value ) : super.dirty(value);

  String? get getErrorMessage {

    if( isValid || isPure ) return null;

    if( displayError == NombreError.empty ) return 'El campo es requerido';
    if( displayError == NombreError.length ) return 'Minimo 3 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NombreError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return NombreError.empty;
    if (value.length < 3) return NombreError.length;

    return null;
  }
}
