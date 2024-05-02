import 'package:flutter/material.dart';

Future<dynamic>showConfirmationDialog(
  BuildContext context, {
  // foram colocados parametros adicionais
// caso nao sejam preenchidos, esses serão os parametros padrões que aparecerão no dialog
  String title = "Atenção!",
  String content = "Você realmente deseja realizar essa ação?",
  String affirmativeOption = "Confirmar",
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(affirmativeOption.toUpperCase(),
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      );
    },
  );
}
