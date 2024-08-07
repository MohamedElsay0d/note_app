import 'package:flutter/material.dart';
import 'package:note_app/Database/NoteDatabase.dart';
import 'package:note_app/models/NoteModel.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  List<NoteModel> notes = [];

  @override
  void initState() {
    super.initState();
    notes = getAllNotes();
    setState(() {});
  }

  getAllNotes() async {
    NoteDatabase noteDatabase = NoteDatabase();
    List<Map<String, dynamic>> list_notes = await noteDatabase.readNotes();
    List<NoteModel> temp_notes = [];
    for (var element in list_notes) {
      NoteModel noteModel = NoteModel(
          element['Note_ID'], element['Note_Title'], element['Note_Content']);
      temp_notes.add(noteModel);
    }
    return temp_notes;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
