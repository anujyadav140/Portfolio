import 'package:flutter/material.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hobbies")),
      body: Center(
        child: Container(
          child: const Text("My Hobbies"),
        ),
      ),
    );
  }
}
