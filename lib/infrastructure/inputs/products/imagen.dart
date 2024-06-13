import 'dart:typed_data';
import 'package:formz/formz.dart';

enum ImagenError { empty }

class Imagen extends FormzInput<Uint8List?, ImagenError> {
  const Imagen.pure() : super.pure(null);
  const Imagen.dirty(Uint8List? value) : super.dirty(value);

  @override
  ImagenError? validator(Uint8List? value) {
    if (value == null) {
      return ImagenError.empty;
    }
    return null;
  }
}
