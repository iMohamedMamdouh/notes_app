import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());

  List<NoteModel>? readNotes;

  featchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    readNotes = notesBox.values.toList();
  }
}
