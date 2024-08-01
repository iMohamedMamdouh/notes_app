import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    required this.icon2,
  });

  final String title;
  final IconData? icon;
  final IconData icon2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
        if (icon != null) CustomIcon(icon: icon!),
        const SizedBox(width: 21),
        CustomIcon(icon: icon2), // Only show if icon2 is provided
      ],
    );
  }
}
