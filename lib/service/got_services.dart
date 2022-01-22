import 'dart:convert';
import 'package:example_api_got_castles/model/model.dart';
import 'package:http/http.dart' as http;

// CLasse para usar o serviço, que seria pegar os castelos poir http

class GotServices {

  Future<List<Castle>> fetchCastles() async {

                         // BASE URL              // ENDPOINT
    final url = Uri.http('api.got.show', 'api/show/castles');

    final response = await http.Client().get(url);

    if(response.statusCode == 200) {

      print(response.body.toString()); // retorna como json
      print(response.statusCode);

      List<dynamic> castles = json.decode(response.body);

      // Retornando uma lista de castelos;
      // map - recebe uma lista de objeto direto da API e cada objeto entra como elemento(castle);
      // fromJson - pega esse objeto e converte para json;
      List<Castle> listCastle = castles.map((castles) => Castle.fromJson(castles)).toList();

      // json.decode - eu tenho um json vindo da API eu preciso converter para Map;
      // json.encode - eu tenho um Map e quero converter para json;

      return listCastle;
    } else {
      return [];
    }

  }

}