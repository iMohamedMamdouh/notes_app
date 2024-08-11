import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/empty_view.dart';
import 'package:notes_app/views/widgets/show_dialog_for_delete.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModel> readNotes =
            BlocProvider.of<ReadNotesCubit>(context).readNotes ?? [];

        if (readNotes.isEmpty) {
          return const EmptyView();
        }

        readNotes = readNotes.reversed.toList();

        return ListView.builder(
          itemCount: readNotes.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 8.0),
          itemBuilder: (context, index) {
            if (index >= readNotes.length) {
              return const SizedBox
                  .shrink(); // Return empty widget if index is out of range
            }
            final note = readNotes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ShowDialogForDelete(note: note),
            );
          },
        );
      },
    );
  }
}
