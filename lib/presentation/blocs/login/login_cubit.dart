import 'package:cutap/domain/models/login_user_model.dart';
import 'package:cutap/domain/models/usuarios_model.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart'; // Asegúrate de importar la librería dio correcta
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cutap/infrastructure/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginFormState> {
  LoginCubit() : super(const LoginFormState());

  void onSubmit(BuildContext context) async {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: LUsername.dirty(state.username.value),
      password: LPassword.dirty(state.password.value),
    ));

    try {
      final LoginUser user = LoginUser(
        username: state.username.value,
        password: state.password.value,
      );

      final bool isAuthenticated = await _authenticateUser(user);
      if (isAuthenticated) {
        if (context.mounted) {
          context.go('/barraNavegacion');
        }
      } else {
        final bool isAdmin = await _checkIfAdmin(user);
        if (isAdmin && context.mounted) {
          context.go('/admins/home/0');
        } else {
          emit(state.copyWith(formStatus: FormStatus.invalid));
        }
      }
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(formStatus: FormStatus.invalid));
    }
  }

  Future<bool> _authenticateUser(LoginUser user) async {
    final Map<String, dynamic> usuarioJson = user.toJson();
    final request = ApiRequest(
      methodType: 'post',
      endpoint: '/Usuarios/Auth',
      data: usuarioJson,
    );

    try {
      emit(state.copyWith(formStatus: FormStatus.posting));
      final Response response = await request.request();
      emit(state.copyWith(formStatus: FormStatus.valid));
      return response.data != null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print('User not found in API: ${e.response?.data}');
        return false;
      } else {
        rethrow;
      }
    }
  }

  Future<bool> _checkIfAdmin(LoginUser user) async {
    final db = FirebaseFirestore.instance;

    final List<Usuario> firebaseUsers = await db
        .collection("admins")
        .get()
        .then((value) =>
            value.docs.map((doc) => Usuario.fromJson(doc.data())).toList());

    return firebaseUsers.any((usuario) =>
        usuario.username == user.username && usuario.password == user.password);
  }

  void usernameChanged(String value) {
    final username = LUsername.dirty(value);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = LPassword.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username]),
    ));
  }
}
