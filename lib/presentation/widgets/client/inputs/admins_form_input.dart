import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCustomInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorMessage;
  final String hint;
  final String title;

  const AdminCustomInput({
    super.key,
    this.validator,
    this.onChanged,
    this.errorMessage,
    required this.hint,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Container(
            height: 80,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: TextFormField(
              onChanged: onChanged,
              validator: validator,
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
                  fillColor: Colors.white,
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: hint,
                  errorText: errorMessage),
            ),
          )
        ],
      ),
    );
  }
}
