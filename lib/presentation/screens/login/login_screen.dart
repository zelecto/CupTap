// import 'package:dio/dio.dart';
import 'package:cutap/presentation/blocs/login/login_cubit.dart';
import 'package:cutap/presentation/screens/Widgets/inputs/custom_inputs.dart';
import 'package:cutap/presentation/widgets/square_tile.dart';
// import 'package:cutap/config/api/api_request.dart'
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Future signIn() async {
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final username = loginCubit.state.username;
    final password = loginCubit.state.password;
    final formStatus = loginCubit.state.formStatus;
    final isValid = loginCubit.state.isValid;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Image.asset('assets/images/CupTapLogo.png',
                  width: 150, height: 150),
              // Mensajes de bienvenida
              Text(
                'Bienvenido',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Branding de la empresa',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 40),

              CustomTextFormField(
                onChanged: loginCubit.usernameChanged,
                errorMessage: username.getErrorMessage,
                hint: 'Nombre de usuario',
              ),

              const SizedBox(height: 10),

              //Contraseña textfield
              CustomTextFormField(
                hint: 'Contraseña',
                onChanged: loginCubit.passwordChanged,
                errorMessage: password.getErrorMessage,
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // Botón de iniciar sesión
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: isValid ? () => loginCubit.onSubmit(context) : null,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: !isValid || formStatus == FormStatus.posting
                            ? Colors.blue[700]
                            : Colors.blueAccent),
                    child: Center(
                        child: formStatus == FormStatus.posting
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text('Iniciar sesión',
                                style: TextStyle(
                                  color: !isValid ? Colors.grey : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ))),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //Enlace a la pantalla de home ( inicio de sesion sin usuario )

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 10.0),
                        child: Divider(
                          color: Colors.grey[800],
                          height: 36,
                        )),
                  ),
                  const Text(
                    "O continúa con",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 30),
                        child: Divider(
                          color: Colors.grey[800],
                          height: 36,
                        )),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              //Botones de inicio de sesion
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Google Button
                  SquareTile(imagePath: "assets/images/google_logo.png"),

                  SizedBox(width: 20),

                  //GitHub Button
                  SquareTile(imagePath: "assets/images/github_logo.png"),

                  SizedBox(width: 20),

                  //GitHub Button
                  SquareTile(imagePath: "assets/images/incognito_logo.png"),
                ],
              ),

              const SizedBox(height: 25),

              //Enlace a la pantalla de registro para los nuevos usuarios
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No eres usuario?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => context.push('/register_screen'),
                    child: const Text(
                      ' ¡Registrate ahora!',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
