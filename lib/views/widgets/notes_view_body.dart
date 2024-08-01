import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
      child: Column(
        children: [
          SizedBox(height: 44.0),
          CustomAppBar(),
          SizedBox(height: 8.0),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
