import 'package:flutter/material.dart';
import 'package:note_app/models/NoteModel.dart';
import 'package:note_app/widgets/NoteCard.dart';

class NotesListView extends StatelessWidget {
  final List<NoteModel> notes;
  final Function(NoteModel) onDelete;

  const NotesListView({
    super.key,
    required this.notes,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      separatorBuilder: (context, i) {
        return const SizedBox(
          height: 12,
        );
      },
      itemBuilder: (context, i) {
        return NoteCard(
          notes: notes[i],
          onDelete: () => onDelete(notes[i]),
        );
      },
    );
  }
}
