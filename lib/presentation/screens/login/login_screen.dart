// import 'package:dio/dio.dart';
import 'package:cutap/config/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  //Controladores de los text fields.
  final dio = Dio();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    // final response = await dio
    var apiRequest = ApiRequest(
        methodType: "get",
        endpoint: "https://cuptapapi.onrender.com/v1/Usuarios",
        data: null);

    var response = await apiRequest.request();

    apiRequest.loading.listen((isLoading){
      if(isLoading){
        print('Cargando...');
      }else{
        print(response);
      }
    });

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
                      controller: _emailController,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}