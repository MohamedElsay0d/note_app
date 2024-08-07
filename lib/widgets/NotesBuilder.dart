import 'package:flutter/material.dart';
import 'package:note_app/widgets/NotesListView.dart';

import '../Database/NoteDatabase.dart';
import '../models/NoteModel.dart';

class NotesBuilder extends StatefulWidget {
  const NotesBuilder({super.key});

  @override
  State<NotesBuilder> createState() => _NotesBuilderState();
}

class _NotesBuilderState extends State<NotesBuilder> {
  late Future<List<NoteModel>> _noteFuture;
  List<NoteModel> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    _noteFuture = getAllNotes();
    _notes = await _noteFuture;
    setState(() {});
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

  Future<void> _deleteNote(NoteModel note) async {
    NoteDatabase noteDatabase = NoteDatabase();
    await noteDatabase.deleteData(note.id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Note is deleted'),
        duration: Duration(milliseconds: 800),
      ),
    );
    _notes.remove(note);
    setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NoteModel>>(
      future: _noteFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NotesListView(
            notes: _notes,
            onDelete: _deleteNote,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Opps! there was an error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
