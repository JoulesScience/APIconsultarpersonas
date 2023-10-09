import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<personassexo>> buscarPersonasSexo(String s) async {
  var url = Uri.parse("http://adsojoules.xp3.biz/genral/api_consulta.php");
  final response = await http.post(url, body: {"sexo": s});

  if (response.statusCode == 200) {
    return compute(pasaraListapqrs, response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}

List<personassexo> pasaraListapqrs(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar
      .map<personassexo>((json) => personassexo.fromJson(json))
      .toList();
}

class personassexo {
  final ID;
  final CODIGO;
  final NOMBRE;
  final SEXO;

  personassexo({this.ID, this.CODIGO, this.NOMBRE, this.SEXO});

  factory personassexo.fromJson(Map<String, dynamic> json) {
    return personassexo(
        ID: json['ID'],
        CODIGO: json['CODIGO'],
        NOMBRE: json['NOMBRE'],
        SEXO: json['SEXO']);
  }
}
