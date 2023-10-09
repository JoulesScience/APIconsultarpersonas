import 'package:conbdmysql/api/buscaPersonaSexo.dart';
import 'package:conbdmysql/controlador/contrador_horario.dart';
import 'package:conbdmysql/proceso/searchPerson.dart';
import 'package:conbdmysql/proceso/searchPersonSexo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class modalpersonasexo {
  ControlPersonas control = Get.find();

  void modalpersonasexoConsulta(BuildContext context, String sexo) {
    buscarPersonasSexo(sexo).then((respuesta) {
      control.Cargalista_sexo(respuesta);
      modalpersonassexoMostrar(context);
    });
  }

  void modalpersonassexoMostrar(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext c2) {
          return Column(
            children: [
              AppBar(
                title: Text("Regresar"),
                actions: [
                  IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: searchPersonSexo(control.sexo));
                      },
                      icon: Icon(Icons.search))
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: control.sexo!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(control.sexo![index].NOMBRE),
                          subtitle: Text("Sexo : " + control.sexo![index].SEXO),
                          leading: Text(control.sexo![index].CODIGO),
                        ),
                      );
                    }),
              )
            ],
          );
        });
  }
}
