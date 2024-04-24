// rodar json server como o comando:
// json-server --watch --host MEUIP db.json

import "dart:convert";

import "package:flutter_webapi_first_course/models/journal.dart";
import "package:flutter_webapi_first_course/services/http_interceptors.dart";
import "package:http/http.dart" as http;
import "package:http_interceptor/http/http.dart";

class JournalService {
  static const String url = "http://192.168.0.5:3000/";
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal
        .toMap()); // apos transformar para mapa, o json.encode transforma em json
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonJournal,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
