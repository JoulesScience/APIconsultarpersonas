import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<premio>> consultaGeneralPersonas() async {
  var url = Uri.parse("http://adsojoules.xp3.biz/genral/api.php");
  final response = await http.post(url, body: {});

  if (response.statusCode == 200) {
    return compute(pasaraListapqrs, response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}

List<premio> pasaraListapqrs(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar.map<premio>((json) => premio.fromJson(json)).toList();
}

class premio {
  final ID;
  final CODIGO;
  final NOMBRE;
  final SEXO;

  premio({this.ID, this.CODIGO, this.NOMBRE, this.SEXO});

  factory premio.fromJson(Map<String, dynamic> json) {
    return premio(
        ID: json['ID'],
        CODIGO: json['CODIGO'],
        NOMBRE: json['NOMBRE'],
        SEXO: json['SEXO']);
  }
}
