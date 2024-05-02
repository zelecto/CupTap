import 'package:cutap/domain/models/usuarios_model.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cutap/infrastructure/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginFormState> {
  LoginCubit() : super(const LoginFormState());

  void onSubmit( BuildContext context ) async {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: LUsername.dirty(state.username.value),
      password: LPassword.dirty(state.password.value),
    ));

    final db = FirebaseFirestore.instance;

    try {
      final request =
          ApiRequest(methodType: 'get', endpoint: '/Usuarios', data: null);
      emit(state.copyWith(formStatus: FormStatus.posting));
      final Response response = await request.request();
      emit(state.copyWith(formStatus: FormStatus.valid));

      final List<Usuario> firebaseUsers = await db
          .collection("admins")
          .get()
          .then((value) =>
              value.docs.map((doc) => Usuario.fromJson(doc.data())).toList());

      final usuarios = List<Usuario>.from(
          response.data['data'].map((usuario) => Usuario.fromJson(usuario)));

      if (usuarios.any((usuario) => usuario.username == state.username.value)) {
        context.go('/barraNavegacion');
      } else if (firebaseUsers
          .any((usuario) => usuario.username == state.username.value)) {
        context.go('/barraNavegacion2');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void usernameChanged(String value) {
    final username = LUsername.dirty(value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.password,
        ])));
  }

  void passwordChanged(String value) {
    final password = LPassword.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([
          password,
          state.username,
        ])));
  }
}
