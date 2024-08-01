import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_textfield.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextfield(
              hintText: 'Title',
            ),
            CustomTextfield(
              hintText: 'Content',
              maxlines: 8,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
