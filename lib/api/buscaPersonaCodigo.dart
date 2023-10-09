import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<personascodigo>> buscarPersonasCodigo(String codigo) async {
  var url = Uri.parse("http://adsojoules.xp3.biz/genral/api_consultaCodigo.php");
  final response = await http.post(url, body: {"codigo": codigo});

  if (response.statusCode == 200) {
    return compute(pasaraListapqrs, response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}

List<personascodigo> pasaraListapqrs(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar
      .map<personascodigo>((json) => personascodigo.fromJson(json))
      .toList();
}

class personascodigo {
  final ID;
  final CODIGO;
  final NOMBRE;
  final SEXO;

  personascodigo({this.ID, this.CODIGO, this.NOMBRE, this.SEXO});

  factory personascodigo.fromJson(Map<String, dynamic> json) {
    return personascodigo(
        ID: json['ID'],
        CODIGO: json['CODIGO'],
        NOMBRE: json['NOMBRE'],
        SEXO: json['SEXO']);
  }
}
