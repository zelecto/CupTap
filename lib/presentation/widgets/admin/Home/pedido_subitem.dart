import 'package:flutter/material.dart';

class OrderSubitem extends StatelessWidget {
  final IconData iconData;
  final String text;

  const OrderSubitem({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
