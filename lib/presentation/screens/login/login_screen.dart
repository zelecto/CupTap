// import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutap/infrastructure/models/usuarios_model.dart';
// import 'package:cutap/config/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  //Controladores de los text fields.
  final dio = Dio();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    final db = FirebaseFirestore.instance;
    List<Usuario> usuarios = await db.collection("admins").get().then((value) =>
        value.docs.map((doc) => Usuario.fromJson(doc.data())).toList());

    String username = _usernameController.text;
    String password = _passwordController.text;

    try {
      if (usuarios.any((usuario) =>
          usuario.username == username && usuario.password == password)) {
        if (mounted) {
          context.go("/barraNavegacion");
        }
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Image.asset('assets/images/CupTapLogo.png',
                  width: 200, height: 200),
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
                'Solo para los más insanos de la región',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),

              // Nombre de usuario textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nombre de usuario',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //Contraseña textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Contraseña',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Botón de iniciar sesión
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: signIn,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blueAccent),
                    child: const Center(
                        child: Text('Iniciar sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ))),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //Enlace a la pantalla de registro para los nuevos usuarios
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No eres usuario?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ¡Registrate ahora!',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              //Enlace a la pantalla de home ( inicio de sesion sin usuario )

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.grey[800],
                          height: 36,
                        )),
                  ),
                  const Text("O continúa sin usuario"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10.0),
                        child: Divider(
                          color: Colors.grey[800],
                          height: 36,
                        )),
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
