// import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutap/infrastructure/models/usuarios_model.dart';
import 'package:cutap/presentation/widgets/square_tile.dart';
// import 'package:cutap/config/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  // Variable para rastrear si la llamada a la API está en curso
  bool _isLoading = false;

  Future signIn() async {
    setState(() {
      _isLoading = true; // Comienza la llamada a la API
    });

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
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // Termina la llamada a la API
        });
      }
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
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Ingrese un usuario";
                        }else{
                          return null;
                        }
                      },
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
                  onTap: _isLoading ? null : signIn,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _isLoading ? Colors.blue[700] : Colors.blueAccent),
                    child: Center(
                        child: _isLoading
                            ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ) // Muestra un indicador de progreso durante la llamada a la API
                            : const Text('Iniciar sesión',
                                style: TextStyle(
                                  color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
