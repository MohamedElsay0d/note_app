import 'package:flutter/material.dart';

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
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
        leading: const Icon(
          Icons.note_alt,
          size: 30,
        ),
        trailing: const IconButton(
            onPressed: null, icon: Icon(Icons.delete_forever_sharp, size: 25)),
      ),
    );
  }
}
