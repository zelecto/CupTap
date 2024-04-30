import 'package:cutap/config/api/api_request.dart';
import 'package:cutap/infrastructure/models/usuarios_model.dart';
import 'package:cutap/presentation/screens/Widgets/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Controlador del formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Controladores de los textFormFields
  final _cedulaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();

  Future register() async {
    final usuario = Usuario(
            cedula: _cedulaController.text,
            nombre: _nombreController.text,
            apellidos: _apellidosController.text,
            telefono: _telefonoController.text,
            username: _usernameController.text,
            password: _passwordController.text)
        .toJson();

    final response =
        ApiRequest(methodType: 'post', endpoint: '/Usuarios', data: usuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo
                  Image.asset('assets/images/CupTapLogo.png',
                      width: 125, height: 125),

                  // Mensajes de bienvenida
                  const Text(
                    'Creemos una cuenta para ti',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                      controller: _cedulaController,
                      hint: 'Cedula',
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Campo requerido';
                        if (value.trim().isEmpty) return 'Campo requerido';
                        if (value.length < 6) return 'Mas de 6 letras';

                        return null;
                      }),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                      controller: _nombreController, hint: 'Nombre'),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                      controller: _apellidosController, hint: 'Apellidos'),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                      controller: _telefonoController, hint: 'Telefono'),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                      controller: _usernameController,
                      hint: 'Nombre de usuario'),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    controller: _passwordController,
                    hint: 'Contraseña',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Campo requerido';
                      if (value.trim().isEmpty) return 'Campo requerido';
                      if (value.length < 6) return 'Mas de 6 letras';

                      final passwordRegExp = RegExp(
                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

                      if (!passwordRegExp.hasMatch(value))
                        return 'Minimo 8 caracteres, una letra, un numero y un caracter especial';

                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    controller: _repeatedPasswordController,
                    hint: 'Repetir contraseña',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //Boton de registrarse
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: InkWell(
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) return;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent),
                        child: const Center(
                            child: Text('Registrarse',
                                style: TextStyle(
                                  color: Colors.white,
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
                ],
              ),
            ),
          ),
        ));
  }
}
