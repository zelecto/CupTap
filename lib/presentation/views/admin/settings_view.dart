import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/custom_appbar.dart';
import 'package:cutap/presentation/widgets/client/widgets_reutilizables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textoGris =
        TextStyle(color: Colors.grey.shade500, fontSize: 18);
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Cuenta',
          showAction: false,
          leading: IconButton(
              onPressed: () => context.go('/'), icon: Icon(Iconsax.logout)),
          bgColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      SizedBox(
                          width: ScreenSize.screenWidth * 0.5,
                          height: ScreenSize.screenHeight * 0.25,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/IconoHombre.png",
                                fit: BoxFit.fill,
                              ))),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const TextoConNegrita(
                              texto: "Nathan Ospino", fontSize: 20)),
                      Text(
                        "Administrador",
                        style: textoGris,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "Nombre",
                style: textoGris,
              ),
              const InformacionUsuario(
                icon: Icon(Icons.account_circle_outlined),
                texto: "Nathan Ospino",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Correo",
                style: textoGris,
              ),
              const InformacionUsuario(
                icon: Icon(Icons.mark_email_unread_outlined),
                texto: "ndospino@unicesar.edu.co",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Numero telefono",
                style: textoGris,
              ),
              const InformacionUsuario(
                icon: Icon(Icons.phone_android),
                texto: "3152661330",
              ),
              const Spacer(),
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const Text("FECHA DE CREACION"),
                      Text(
                        "08/05/2024",
                        style: textoGris,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Icon icon;
  final String texto;

  const InformacionUsuario({
    super.key,
    required this.icon,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 20,
          ),
          TextoConNegrita(texto: texto, fontSize: 20),
        ],
      ),
    );
  }
}
