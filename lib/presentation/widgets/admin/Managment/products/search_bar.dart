import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Color iconColor;
  final String hint;
  final IconData icon;

  const CustomSearchBar(
      {super.key,
      required this.hint,
      required this.iconColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(width: 16),
              Text(hint)
            ],
          )),
    );
  }
}
