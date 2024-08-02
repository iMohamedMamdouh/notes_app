import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.maxlines = 1,
      this.onSaved,
      this.onChanged});

  final String hintText;
  final int maxlines;

  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter some text';
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFF3B3B3B),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
