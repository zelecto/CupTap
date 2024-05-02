import 'package:cutap/presentation/blocs/register/register_cubit.dart';
import 'package:cutap/presentation/screens/Widgets/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';
// import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final cedula = registerCubit.state.cedula;
    final nombre = registerCubit.state.nombre;
    final apellidos = registerCubit.state.apellidos;
    final telefono = registerCubit.state.telefono;
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final confirmedPassword = registerCubit.state.confirmedPassword;
    final isValid = registerCubit.state.isValid;
    final formStatus = registerCubit.state.formStatus;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (formStatus == FormStatus.submissionSuccess) {
        QuickAlert.show(
            title: 'Éxito', context: context, type: QuickAlertType.success);
      } else if (formStatus == FormStatus.submissionFailure) {
        QuickAlert.show(
            title: 'No se ha podido crear el usuario',
            context: context,
            type: QuickAlertType.error,
            autoCloseDuration: Duration(seconds: 3));
      }
    });

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo
                  SafeArea(
                    child: Image.asset('assets/images/CupTapLogo.png',
                        width: 125, height: 125),
                  ),

                  // Mensaje de bienvenida
                  const Text(
                    'Creemos una cuenta para ti',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    onChanged: registerCubit.cedulaChanged,
                    errorMessage: cedula.getErrorMessage,
                    hint: 'Cedula',
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    hint: 'Nombre',
                    errorMessage: nombre.getErrorMessage,
                    onChanged: registerCubit.nombreChanged,
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    hint: 'Apellidos',
                    errorMessage: apellidos.getErrorMessage,
                    onChanged: registerCubit.apellidosChanged,
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    hint: 'Telefono',
                    errorMessage: telefono.getErrorMessage,
                    onChanged: registerCubit.telefonoChanged,
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    hint: 'Nombre de usuario',
                    errorMessage: username.getErrorMessage,
                    onChanged: registerCubit.usernameChanged,
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    hint: 'Contraseña',
                    obscureText: true,
                    onChanged: registerCubit.passwordChanged,
                    errorMessage: password.getErrorMessage,
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    hint: 'Repetir contraseña',
                    obscureText: true,
                    onChanged: registerCubit.confirmedPasswordChanged,
                    errorMessage: confirmedPassword.getErrorMessage,
                  ),

                  const SizedBox(height: 25),

                  //Boton de registrarse
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: InkWell(
                      onTap: !isValid
                          ? null
                          : () {
                              registerCubit.onSubmit();
                            },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: !isValid
                                ? Colors.blue[700]
                                : Colors.blueAccent),
                        child: Center(
                            child: (formStatus == FormStatus.posting)
                                ? const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text('Registrarse',
                                    style: TextStyle(
                                      color:
                                          !isValid ? Colors.grey : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ))),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  //Enlace a la pantalla de inicio sesión para los usuarios existentes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya eres usuario?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () => context.pop(),
                        child: const Text(
                          ' Inicia sesión',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ));
  }
}
