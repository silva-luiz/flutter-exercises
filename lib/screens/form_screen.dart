import 'package:first_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({required this.taskContext, super.key});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:
              const Text("Nova tarefa", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 830,
              width: 475,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira o nome da tarefa';
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                int.parse(value) > 5 ||
                                int.parse(value) < 1) {
                              return "Insira o nivel de dificuldade da tarefa entre 1 e 5";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: difficultyController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade da tarefa',
                            fillColor: Colors.white70,
                            filled: true,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          onChanged: (text) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Insira um URL de imagem.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                          controller: imageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Adicionar imagem',
                            fillColor: Colors.white70,
                            filled: true,
                          )),
                    ),
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(imageController.text, errorBuilder:
                            (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                          return Image.asset('assets/images/nophoto.png');
                        }, fit: BoxFit.cover),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            TaskInherited.of(widget.taskContext).newTask(
                                nameController.text,
                                imageController.text,
                                int.parse(difficultyController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Salvando sua tarefa!")));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Salvar Tarefa",
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
