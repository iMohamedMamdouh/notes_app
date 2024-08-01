import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
      child: Column(
        children: [
          SizedBox(height: 44.0),
          CustomAppBar(
            icon2: Icons.check,
            title: 'Edit Note',
          ),
          CustomTextfield(hintText: 'Title'),
          CustomTextfield(
            hintText: 'Content',
            maxlines: 8,
          ),
        ],
      ),
    );
  }
}
