import 'package:flutter/material.dart';

import '../Database/NoteDatabase.dart';
import '../models/NoteModel.dart';

class NoteCard extends StatelessWidget {
  NoteModel notes;
  NoteCard({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          notes.title,
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          notes.content,
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 95, 95), fontSize: 15),
        ),
        leading: const Icon(
          Icons.note_alt,
          size: 30,
        ),
        trailing: IconButton(
            onPressed: () async {
              NoteDatabase noteDatabase = NoteDatabase();
              await noteDatabase.deleteData(notes.id);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Note is deleted'),
                  duration: Duration(milliseconds: 800),
                ),
              );
            },
            icon: Icon(Icons.delete_forever_sharp, size: 25)),
      ),
    );
  }
}
