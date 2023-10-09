import 'package:conbdmysql/api/guardaPersona.dart';
import 'package:flutter/material.dart';

class modalpersonainsertar {
  final txtcodigo = TextEditingController();
  final txtsexo = TextEditingController();
  final txtnombre = TextEditingController();

  void modalinsertar(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
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
                      hintText: "0987654321", labelText: "Codigo"),
                ),
                TextField(
                  controller: txtnombre,
                  decoration: InputDecoration(
                      hintText: "AA BB CC", labelText: "Nombre"),
                ),
                TextField(
                  controller: txtsexo,
                  decoration:
                      InputDecoration(hintText: " M/F ", labelText: "Sexo"),
                ),
                Divider(),
                ElevatedButton.icon(
                    onPressed: () {
                      guardaPersona(
                              txtcodigo.text, txtnombre.text, txtsexo.text)
                          .then((respuesta) {});
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.save),
                    label: Text("Guardar"))
              ],
            ),
          );
        });
  }
}
