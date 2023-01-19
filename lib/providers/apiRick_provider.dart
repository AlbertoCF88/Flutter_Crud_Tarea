import 'dart:convert';
import 'dart:developer';

import 'package:ejercicio01_crud/models/PersonajeRick_model.dart';
import 'package:http/http.dart';

class HttpService {
  //La url para llamar a la api
  final String url = 'https://rickandmortyapi.com/api/character/';

  //  metodo asincrono
  //Traer un personaje por id
  Future<PersonajeRick> getIdPersonaje(idPj) async {
    log("url provider $idPj");

    Response res = await get(Uri.parse('$url$idPj'));
    log("pro res $url$idPj");
    if (res.statusCode == 200) {
      return PersonajeRick.fromJson(json.decode(res.body));
    } else {
      //Ha ocurrido algun fallo -> 400, 404, 500
      throw Exception("Personaje no econtrado");
    }
  }

  //Traer lista de personajes
  Future<List<PersonajeRick>> getPersonajes() async {
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      List<dynamic> lista = jsonDecode(res.body)['results'];
      List<PersonajeRick> characters =
          lista.map((item) => PersonajeRick.fromJson(item)).toList();
      return characters;
    } else {
      throw Exception('error');
    }
  }
}
