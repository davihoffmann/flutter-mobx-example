import 'dart:convert';

import 'package:flutter_app_mobx_exemple/model/carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static const String CLASSICO = "classicos";
  static const String ESPORTIVO = "esportivos";
  static const String LUXO = "luxo";
}

class CarroService {
  static Future<List<Carro>> getCarros() async {
    
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';
    var response = await http.get(url, headers: headers);

    List list = json.decode(response.body);

    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }
}
