import 'package:flutter/material.dart';
import 'package:note_app/Database/NoteDatabase.dart';
import 'package:note_app/models/NoteModel.dart';
import 'package:note_app/widgets/NoteCard.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  List<NoteModel> notes = [];

@override
void initState() {
  super.initState();
 Future.delayed(Duration.zero, _loadNotes);
}

Future<void> _loadNotes() async {
  final notesList = await getAllNotes();
  setState(() {
    notes = notesList;
  });
}

Future<List<NoteModel>> getAllNotes() async {
  NoteDatabase noteDatabase = NoteDatabase();
  List<Map<String, dynamic>> list_notes = await noteDatabase.readNotes();
  List<NoteModel> tempNotes = [];
  for (var element in list_notes) {
    NoteModel noteModel = NoteModel(
        element['Note_ID'], element['Note_Title'], element['Note_Content']);
    tempNotes.add(noteModel);
  }
  return tempNotes;
}

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
        return NoteCard(notes: notes[i]);
      },
    );
  }
}
