import 'package:formz/formz.dart';

// Define input validation errors
enum CantidadError { empty, length, isNumber }

// Extend FormzInput and provide the input type and error type.
class Cantidad extends FormzInput<String, CantidadError> {
  static final RegExp onlyNumbersRegExp = RegExp(r'^[0-9]*$');
  // Call super.pure to represent an unmodified form input.
  const Cantidad.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Cantidad.dirty( String value ) : super.dirty(value);

  String? get getErrorMessage {

    if( isValid || isPure ) return null;

    if( displayError == CantidadError.empty ) return 'El campo es requerido';
    if( displayError == CantidadError.length ) return 'Minimo 1 caracteres';
    if( displayError == CantidadError.isNumber ) return 'La cantidad debe ser un numero';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CantidadError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return CantidadError.empty;
    if (value.length < 1) return CantidadError.length;
    if(!onlyNumbersRegExp.hasMatch(value)) return CantidadError.isNumber;

    return null;
  }
}
