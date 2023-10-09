import 'package:conbdmysql/api/buscaPersonaSexo.dart';
import 'package:conbdmysql/api/buscaPremios.dart';
import 'package:conbdmysql/controlador/contrador_horario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchPersonSexo extends SearchDelegate {
  ControlPersonas controlC = Get.find();

  final List<personassexo>? pue;
  List<personassexo>? _filtro = [];
  searchPersonSexo(this.pue); // constructor inicializar un ojeto o variable

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filtro = pue!.where((puevot) {
      return puevot.NOMBRE
          .toString()
          .toLowerCase()
          .contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: _filtro!.length,
      itemBuilder: (context, index) => Card(
        //key: ValueKey(Resp1[index].ID),
        child: ListTile(
          leading: Text(_filtro![index].CODIGO),
          trailing: Text(_filtro![index].SEXO),
          title: Text(_filtro![index].NOMBRE),
          subtitle: Text("Identificación: " + _filtro![index].ID),
          //  trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
