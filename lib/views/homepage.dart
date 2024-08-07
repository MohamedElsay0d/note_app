import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, i) {
          return const SizedBox(
            height: 15,
          );
        },
        itemBuilder: (context, i) {
          return const SizedBox(
            child: Text("Medo"),
          );
        },
      ),
    );
  }
}
