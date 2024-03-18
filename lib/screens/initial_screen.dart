import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opac = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Tarefas", style: TextStyle(color: Colors.white)),
        ),
        body: AnimatedOpacity(
          opacity: opac ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: ListView(
            children: const [
              Task(
                  "Aprender Flutter",
                  'assets/images/image01.jpeg',
                  3),
              Task(
                  "Aprender Dart",
                  'assets/images/image02.png',
                  2),
              Task(
                  "Aprender Git",
                  'assets/images/image03.png',
                  3),
              Task(
                  "Aprender BackEnd",
                  'assets/images/image04.jpg',
                  5),
                  SizedBox(height: 80,),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opac = !opac;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        ),
      )
;
  }
}