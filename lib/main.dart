import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opac = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Tarefas", style: TextStyle(color: Colors.white)),
        ),
        body: AnimatedOpacity(
          opacity: opac ? 1 : 0,
          duration: Duration(milliseconds: 500),
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
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String pic;
  final int dif;

  const Task(this.name, this.pic, this.dif, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              //boxShadow: BoxShadow(),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                      width: 100,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.pic,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 15,
                                color: widget.dif >= 1
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: widget.dif >= 2
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: widget.dif >= 3
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: widget.dif >= 4
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: widget.dif >= 5
                                    ? Colors.blue
                                    : Colors.blue[100]),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                      height: 64,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text('UP'),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 250,
                        child: LinearProgressIndicator(
                          value:
                              (widget.dif > 0 ? (level / widget.dif) / 10 : 1),
                        )),
                    Text("Nivel $level",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}
