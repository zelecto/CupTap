import 'package:cutap/infrastructure/inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      cedula: Cedula.dirty(state.cedula.value),
      nombre: Nombre.dirty(state.nombre.value),
      apellidos: Apellidos.dirty(state.apellidos.value),
      telefono: Telefono.dirty(state.telefono.value),
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.cedula.value),
      
    ));

    print('Submit: $state');
  }

  void cedulaChanged(String value) {
    final cedula = Cedula.dirty(value);
    emit(state.copyWith(
        cedula: cedula,
        isValid: Formz.validate([cedula, state.nombre, state.password])));
  }

  void nombreChanged(String value) {
    final nombre = Nombre.dirty(value);

    emit(state.copyWith(
        nombre: nombre,
        isValid: Formz.validate([nombre, state.cedula, state.password])));
  }

  void apellidosChanged(String value) {
    final apellidos = Apellidos.dirty(value);

    emit(state.copyWith(
        apellidos: apellidos,
        isValid: Formz.validate(
            [apellidos, state.cedula, state.nombre, state.password])));
  }

  void telefonoChanged(String value) {
    final telefono = Telefono.dirty(value);

    emit(state.copyWith(
        telefono: telefono,
        isValid: Formz.validate([
          telefono,
          state.cedula,
          state.nombre,
          state.apellidos,
          state.password
        ])));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.telefono,
          state.cedula,
          state.nombre,
          state.apellidos,
          state.password
        ])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.cedula, state.nombre]),
    ));
  }
}
