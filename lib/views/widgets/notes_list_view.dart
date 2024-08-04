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
            if (index >= readNotes.length) {
              return const SizedBox
                  .shrink(); // Return empty widget if index is out of range
            }
            final note = readNotes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Dismissible(
                key: Key(note.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey.shade900,
                          title: const Icon(
                            Icons.info_outline,
                            size: 32,
                          ),
                          content: const Text(
                              "Are you sure you want to delete this note?"),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade800,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("Delete"),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  }
                  return false;
                },
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    BlocProvider.of<ReadNotesCubit>(context).deleteNote(note);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${note.title} deleted')),
                    );
                  }
                },
                background: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                child: NotesItem(note: note, onDelete: () {}),
              ),
            );
          },
        );
      },
    );
  }
}
