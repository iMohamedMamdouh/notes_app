import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

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
        const CustomIcon(icon: Icons.search),
        const SizedBox(width: 21),
        const CustomIcon(icon: Icons.info_outline),
      ],
    );
  }
}
