import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EntityBox extends StatelessWidget {
  final String entityName;
  final IconData icon;
  final String screenRoute;

  const EntityBox(
      {super.key,
      required this.entityName,
      required this.icon,
      required this.screenRoute});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(screenRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              //Icono
              const SizedBox(height: 10),
              Icon(
                icon,
                size: 75,
              ),
      
              const SizedBox(height: 20),
      
              //Nombre de la entidad
              Text(entityName,
                  style:
                      const TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
