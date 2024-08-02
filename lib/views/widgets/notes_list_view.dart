import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModel> readNotes =
            BlocProvider.of<ReadNotesCubit>(context).readNotes ?? [];

        return ListView.builder(
          itemCount: readNotes.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 8.0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: NotesItem(
                note: readNotes[index],
              ),
            );
          },
        );
      },
    );
  }
}
