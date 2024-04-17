import 'package:flutter/material.dart';

class MenuItemCliente {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItemCliente(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItemsCliente = <MenuItemCliente>[
  MenuItemCliente(
      title: 'Informacion',
      subTitle: 'Informacion personal de la cuenta',
      link: '/buttons',
      icon: Icons.info_outline),
  
  MenuItemCliente(
      title: 'Credito',
      subTitle: 'Consulta tu credito',
      link: '/buttons',
      icon: Icons.monetization_on_outlined),
  
];
