import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note, required this.onDelete});

  final NoteModel note;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updatedNote = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(note: note),
          ),
        );

        if (updatedNote != null) {
          // Handle the updated note (e.g., refresh the list)
          // This depends on how you manage state in your app
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    note.content,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Text(
                  note.date,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
