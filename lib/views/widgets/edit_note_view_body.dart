import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 44.0),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();

              BlocProvider.of<ReadNotesCubit>(context).featchAllNotes();

              Navigator.pop(context);
            },
            icon2: Icons.check,
            title: 'Edit Note',
          ),
          CustomTextfield(
            onChanged: (value) {
              title = value;
            },
            hintText: widget.note.title,
          ),
          CustomTextfield(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.note.content,
            maxlines: 8,
          ),
        ],
      ),
    );
  }
}
