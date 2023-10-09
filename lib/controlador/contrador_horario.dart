import 'package:conbdmysql/api/buscaPersonaCodigo.dart';
import 'package:conbdmysql/api/buscaPersonaSexo.dart';
import 'package:conbdmysql/api/buscaPremios.dart';
import 'package:conbdmysql/api/guardaPersona.dart';
import 'package:get/get.dart';

class ControlPersonas extends GetxController {
  // var itemsComboX = [].obs;

  final Rxn<List<premio>> _recibo = Rxn<List<premio>>();

  void Cargalista_recibo(List<premio> X) {
    _recibo.value = X;
  }

  //List? get pREGUNTA => _pREGUNTA.value;
  List<premio>? get recibo => _recibo.value;

////////////////////////////////////
////////////////////////////////////

  final Rxn<List<personassexo>> _sexo = Rxn<List<personassexo>>();

  void Cargalista_sexo(List<personassexo> X) {
    _sexo.value = X;
  }

  //List? get pREGUNTA => _pREGUNTA.value;
  List<personassexo>? get sexo => _sexo.value;

  ////////////////////////////////////
////////////////////////////////////

  final Rxn<List<personainsertar>> _personinsert = Rxn<List<personainsertar>>();

  void Cargalista_personinsert(List<personainsertar> X) {
    _personinsert.value = X;
  }

  //List? get pREGUNTA => _pREGUNTA.value;
  List<personainsertar>? get personInser => _personinsert.value;

  ////////////////////////////////////
////////////////////////////////////

  final Rxn<List<personascodigo>> _personCodigo = Rxn<List<personascodigo>>();

  void Cargalista_personCodigo(List<personascodigo> X) {
    _personCodigo.value = X;
  }

  //List? get pREGUNTA => _pREGUNTA.value;
  List<personascodigo>? get personCodigo => _personCodigo.value;

//////Lista programa
}
