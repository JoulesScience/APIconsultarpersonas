import 'package:conbdmysql/controlador/contrador_horario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class codigoMostar {
  ControlPersonas control = Get.find();

  void mostrarpersonacodigo(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext c2) {
          return Column(
            children: [
              AppBar(
                title: Text("Regresar"),
              ),
              Card(
                child: ListTile(
                    leading: Text(control.personCodigo![0].CODIGO),
                    subtitle: Text(control.personCodigo![0].SEXO),
                    title: Text(control.personCodigo![0].NOMBRE)),
              ),
            ],
          );
        });
  }
}
