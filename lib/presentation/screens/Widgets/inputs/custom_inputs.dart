import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorMessage;
  final String hint;
  final bool obscureText;

  const CustomTextFormField({
      super.key,
      required this.hint,
      this.obscureText = false,
      this.validator,
      this.onChanged,
      this.errorMessage
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 80,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: hint,
            errorText: errorMessage,
          ),
        ),
      ),
    );
  }
}
