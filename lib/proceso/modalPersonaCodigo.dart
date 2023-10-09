import 'package:conbdmysql/api/buscaPersonaCodigo.dart';
import 'package:conbdmysql/controlador/contrador_horario.dart';
import 'package:conbdmysql/proceso/modalpersonaCodigoMostrar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class modalPersonaCodigo {
  final txtcodigo = TextEditingController();
  ControlPersonas control = Get.find();

  void modalpersonacodigoMostar(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c2) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppBar(
                  title: Text("Regresar"),
                ),
                TextField(
                  controller: txtcodigo,
                  decoration: InputDecoration(
                      hintText: "123456789", labelText: "Codigo"),
                ),
                Divider(),
                ElevatedButton.icon(
                    onPressed: () {
                      buscarPersonasCodigo(txtcodigo.text).then((respuesta) {
                        control.Cargalista_personCodigo(respuesta);

                        codigoMostar().mostrarpersonacodigo(context);
                      });
                    },
                    icon: Icon(Icons.search),
                    label: Text("Consultar"))
              ],
            ),
          );
        });
  }
}
