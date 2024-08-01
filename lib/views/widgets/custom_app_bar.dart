import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Notes',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
        CustomIcon(icon: Icons.search),
        SizedBox(width: 21),
        CustomIcon(icon: Icons.info_outline),
      ],
    );
  }
}
