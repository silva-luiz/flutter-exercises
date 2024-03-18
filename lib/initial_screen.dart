import 'package:first_project/task.dart';
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
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task(
                  "Aprender Dart",
                  'https://images.unsplash.com/photo-1594652634010-275456c808d0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  2),
              Task(
                  "Aprender Git",
                  'https://images.unsplash.com/photo-1618401479427-c8ef9465fbe1?q=80&w=1443&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  3),
              Task(
                  "Aprender BackEnd",
                  'https://images.unsplash.com/photo-1627398242454-45a1465c2479?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  5),
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