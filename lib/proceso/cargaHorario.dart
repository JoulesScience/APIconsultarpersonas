import 'package:conbdmysql/controlador/contrador_horario.dart';
import 'package:conbdmysql/proceso/buscarPersona.dart';
import 'package:conbdmysql/proceso/searchPerson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/buscaPremios.dart';

class horario {
  ControlPersonas controlC = Get.find();

  void modalHorario(BuildContext context) {
    consultaGeneralPersonas().then((respuesta) {
      controlC.Cargalista_recibo(respuesta);
    });
    modalCargaHorario(context);
  }

  void modalCargaHorario(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext c2) {
          return Obx(() => controlC.recibo!.isEmpty == false
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        AppBar(
                          title: Text("Consultar 2"),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  showSearch(
                                      context: context,
                                      delegate: searchPerson(controlC.recibo));
                                },
                                icon: Icon(Icons.search))
                          ],
                        ),
                        Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controlC.recibo?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: Colors.blue[100],
                                child: ListTile(
                                    leading:
                                        Text(controlC.recibo![index].CODIGO),
                                    trailing:
                                        Text(controlC.recibo![index].SEXO),
                                    title: Text(controlC.recibo![index].NOMBRE),
                                    subtitle: Text("Identificación: " +
                                        controlC.recibo![index].ID)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                )));
        });
  }
}
