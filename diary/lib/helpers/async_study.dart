/*
import 'dart:math';

asyncStudy() {
  // execucaoNormal();
  // assincronismoBasico();
  // usandoFuncoesAssincronas();
  esperandoFuncoesAssincronas();
}

void execucaoNormal() {
  print("\nExecução normal");
  print("01");
  print("02");
  print("03");
  print("04");
  print("05");
}

void assincronismoBasico() {
  print("\nAssincronismo básico");
  print("01");
  print("02");
  Future.delayed(const Duration(seconds: 2), () {
    print("03");
  });
  print("04");
  print("05");
  print("End");
}

void usandoFuncoesAssincronas() {
  print("Usando funções assíncronas");
  print("A");
  print("B");
  getRandomInt(3).then((value) {
    // o .then quer dizer quando o resultado estiver disponível, seja retornado
    // ou seja, após os 3 segundos determinados, o resultado virá
    print("O número aleatório sorteado é $value");
  });
  print("C");
  print("D");
}

void esperandoFuncoesAssincronas() async {
  print("A");
  print("B");
  int number = await getRandomInt(2);
  print("O número aleatório gerado é $number");
  print("C");
  print("D");
}

Future<int> getRandomInt(int time) async {
  await Future.delayed(Duration(seconds: time));

  Random rng = Random();

  return rng.nextInt(10);
}
*/