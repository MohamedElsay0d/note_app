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
  var future;
  @override
  void initState() {
    super.initState();
    future = getAllNotes();
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
    return FutureBuilder<List<NoteModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NotesListView(
              notes: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Opps! there was an error"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
