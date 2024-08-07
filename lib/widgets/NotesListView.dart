import 'package:flutter/material.dart';
import 'package:note_app/models/NoteModel.dart';
import 'package:note_app/widgets/NoteCard.dart';

class NotesListView extends StatelessWidget {
  List<NoteModel> notes;
  NotesListView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      separatorBuilder: (context, i) {
        return const SizedBox(
          height: 5,
        );
      },
      itemBuilder: (context, i) {
        return NoteCard(notes: notes[i]);
      },
    );
  }
}
