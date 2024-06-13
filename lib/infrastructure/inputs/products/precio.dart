import 'package:formz/formz.dart';

// Define input validation errors
enum PrecioError { empty, length, isNumber }

// Extend FormzInput and provide the input type and error type.
class Precio extends FormzInput<String, PrecioError> {
  static final RegExp onlyNumbersRegExp = RegExp(r'^[0-9]*$');
  // Call super.pure to represent an unmodified form input.
  const Precio.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Precio.dirty( String value ) : super.dirty(value);

  String? get getErrorMessage {

    if( isValid || isPure ) return null;

    if( displayError == PrecioError.empty ) return 'El campo es requerido';
    if( displayError == PrecioError.length ) return 'Minimo 3 caracteres';
    if( displayError == PrecioError.isNumber ) return 'La cantidad debe ser un numero';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PrecioError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return PrecioError.empty;
    if (value.length < 3) return PrecioError.length;
    if(!onlyNumbersRegExp.hasMatch(value)) return PrecioError.isNumber;

    return null;
  }
}
