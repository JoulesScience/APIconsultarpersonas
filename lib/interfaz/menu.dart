import 'package:conbdmysql/proceso/cargaHorario.dart';
import 'package:conbdmysql/proceso/modalPersonaCodigo.dart';
import 'package:conbdmysql/proceso/modalpersonainsertar.dart';
import 'package:conbdmysql/proceso/modalpersonassexo.dart';
import 'package:flutter/material.dart';

class menu {
  void menumostrar(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext c2) {
          return Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Regresar"),
                ),
                Row(
                  children: [
                    Card(
                        color: Colors.amber,
                        child: IconButton(
                            onPressed: () {
                              modalpersonasexo()
                                  .modalpersonasexoConsulta(context, "M");
                            },
                            icon: Icon(Icons.abc))),
                    Card(
                      color: Colors.blue,
                      child: IconButton(
                          onPressed: () {
                            modalpersonasexo()
                                .modalpersonasexoConsulta(context, "F");
                          },
                          icon: Icon(Icons.baby_changing_station)),
                    ),
                    Card(
                        color: Colors.green,
                        child: IconButton(
                            onPressed: () {
                              horario().modalHorario(context);
                            },
                            icon: Icon(Icons.cabin))),
                    Card(
                        color: Colors.grey,
                        child: IconButton(
                            onPressed: () {
                              modalpersonainsertar().modalinsertar(context);
                            },
                            icon: Icon(Icons.dangerous))),
                    Card(
                        color: Colors.orange,
                        child: IconButton(
                            onPressed: () {
                              modalPersonaCodigo()
                                  .modalpersonacodigoMostar(context);
                            },
                            icon: Icon(Icons.e_mobiledata)))
                  ],
                )
              ],
            ),
          );
        });
  }
}
