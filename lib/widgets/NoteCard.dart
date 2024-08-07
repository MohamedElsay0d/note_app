import 'package:flutter/material.dart';

import '../Database/NoteDatabase.dart';
import '../models/NoteModel.dart';

class NoteCard extends StatelessWidget {
  final NoteModel notes;
  final VoidCallback onDelete;
  

  const NoteCard({
    super.key,
    required this.notes,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notes.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(notes.content),
              ],
            ),
            IconButton(
              onPressed: onDelete,
              icon:const Icon(Icons.delete_forever_sharp, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
