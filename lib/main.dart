import 'package:flutter/material.dart';
import 'package:note_app/views/add_note.dart';

import 'views/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage() , 
      routes: {
        "New_Note" : (context) => Add_Note()
      },
    );
  }
}
