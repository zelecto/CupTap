import 'package:cutap/utils/api/api_request.dart';
import 'package:cutap/domain/models/usuarios_model.dart';
import 'package:cutap/infrastructure/inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() async {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      cedula: Cedula.dirty(state.cedula.value),
      nombre: Nombre.dirty(state.nombre.value),
      apellidos: Apellidos.dirty(state.apellidos.value),
      telefono: Telefono.dirty(state.telefono.value),
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.password.value),
      confirmedPassword: ConfirmedPassword.dirty(
          original: Password.dirty(state.password.value),
          value: state.confirmedPassword.value),
    ));

    if (state.isValid) emit(state.copyWith(formStatus: FormStatus.valid));

    final usuario = Usuario(
            cedula: state.cedula.value,
            nombre: state.nombre.value,
            apellidos: state.apellidos.value,
            telefono: state.telefono.value,
            username: state.username.value,
            password: state.password.value)
        .toJson();

    try {
      final post =
          ApiRequest(methodType: 'post', endpoint: '/Usuarios', data: usuario);
      emit(state.copyWith(formStatus: FormStatus.posting));
      await post.request();

      emit(state.copyWith(formStatus: FormStatus.submissionSuccess));
    } catch (e) {
      print('jeje boah');
      emit(state.copyWith(formStatus: FormStatus.submissionFailure));
      //TODO: Limpiar los inputs / campos despues de la solicitud incorrecta
    }
  }

  void cedulaChanged(String value) {
    final cedula = Cedula.dirty(value);
    emit(state.copyWith(
        cedula: cedula,
        isValid: Formz.validate([
          cedula,
          state.nombre,
          state.apellidos,
          state.telefono,
          state.username,
          state.password,
          state.confirmedPassword
        ])));
  }

  void nombreChanged(String value) {
    final nombre = Nombre.dirty(value);

    emit(state.copyWith(
        nombre: nombre,
        isValid: Formz.validate([
          nombre,
          state.cedula,
          state.apellidos,
          state.telefono,
          state.username,
          state.password,
          state.confirmedPassword
        ])));
  }

  void apellidosChanged(String value) {
    final apellidos = Apellidos.dirty(value);

    emit(state.copyWith(
        apellidos: apellidos,
        isValid: Formz.validate([
          apellidos,
          state.cedula,
          state.nombre,
          state.telefono,
          state.username,
          state.password,
          state.confirmedPassword
        ])));
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
          state.username,
          state.password,
          state.confirmedPassword
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
          state.password,
          state.confirmedPassword,
        ])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([
        password,
        state.cedula,
        state.nombre,
        state.apellidos,
        state.telefono,
        state.username,
        state.confirmedPassword
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword =
        ConfirmedPassword.dirty(original: state.password, value: value);
    emit(state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          confirmedPassword,
          state.cedula,
          state.nombre,
          state.apellidos,
          state.telefono,
          state.username,
          state.password
        ])));
  }
}
