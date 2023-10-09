import 'package:conbdmysql/api/buscaPremios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlador/contrador_horario.dart';

class consultaGeneral {
  ControlPersonas CC = Get.find();

  void ConsultaApiPersonaGeneral(BuildContext context) {
    consultaGeneralPersonas().then((r) {
      CC.Cargalista_recibo(r);
    });
    ConsultaPersonasGenerales(context);
  }

  void ConsultaPersonasGenerales(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext c2) {
          return Obx(() => Column(
                children: [
                  AppBar(
                    title: Text("Regresar"),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: CC.recibo!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(CC.recibo![index].NOMBRE);
                      },
                    ),
                  ),
                ],
              ));
        });
  }
}
