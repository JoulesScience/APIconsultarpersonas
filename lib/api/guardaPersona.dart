import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<personainsertar>> guardaPersona(
    String codigo, String nombre, String sexo) async {
  var url =
      Uri.parse("http://adsojoules.xp3.biz/genral/api_insertar_persona.php");
  final response = await http
      .post(url, body: {"sexo": sexo, "codigo": codigo, "nombre": nombre});

  if (response.statusCode == 200) {
    return compute(pasaraListapqrs, response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}

List<personainsertar> pasaraListapqrs(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar
      .map<personainsertar>((json) => personainsertar.fromJson(json))
      .toList();
}

class personainsertar {
  final ID;
  final CODIGO;
  final NOMBRE;
  final SEXO;

  personainsertar({this.ID, this.CODIGO, this.NOMBRE, this.SEXO});

  factory personainsertar.fromJson(Map<String, dynamic> json) {
    return personainsertar(
        ID: json['ID'],
        CODIGO: json['CODIGO'],
        NOMBRE: json['NOMBRE'],
        SEXO: json['SEXO']);
  }
}
