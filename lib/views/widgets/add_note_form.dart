import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, // Ensure the formKey is assigned to the Form widget
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextfield(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          CustomTextfield(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: 'Content',
            maxlines: 7,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                var noteModel = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: DateTime.now().toString(),
                    color: Colors.yellow.value);

                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
