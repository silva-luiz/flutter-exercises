import 'dart:math';

/// Cria uma frase aleatória
String getRandomPhrase() {
  List<String> phrases = [
    "Hoje estou triste, pois caí de Elo",
    "Não estou tão bem, tomei restrição de chat",
    "Hoje estudei bastante controle de Wave!",
    "Dei TrashTalk no chat hoje, que legal!",
    "Hoje consegui sair do Prata, finalmente!",
    "Hoje carreguei meu time jogando de Shaco AP! Uau!"
  ];

  Random rng = Random();
  return phrases[rng.nextInt(phrases.length - 1)];
}
