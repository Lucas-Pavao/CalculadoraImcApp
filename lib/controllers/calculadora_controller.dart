import 'dart:collection';
import 'package:calculadorimcapp/models/imc_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db.dart';

class CalculadoraController extends ChangeNotifier {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final List<Imc> _imcs = [];
  late Database db;

  UnmodifiableListView<Imc> get imcs => UnmodifiableListView(_imcs);

  CalculadoraController() {
    _initController();
  }

  _initController() async {
    await _getImc();
  }

  _getImc() async {
    db = await DB.instance.database;
    List imc = await db.query('imc');
    _imcs.addAll(imc.map((e) => Imc.fromMap(e)));

    notifyListeners();
  }

  _setImc(Imc imc) async {
    db = await DB.instance.database;
    var id = await db.insert(
        'imc', imc.toMap()); // Capturar o id retornado pela inserção
    imc.id = id; // Definir o id do IMC com o valor retornado pela inserção
    _imcs.add(imc);
    notifyListeners();
  }

  removerImc(int id) async {
    DB.instance.deleteIMC(id);
    _imcs.removeWhere((element) => element.id == id);
  }

  calcular() {
    var peso = double.parse(pesoController.text);
    var altura = double.parse(alturaController.text) / 100;
    var imc = _calculaImc(altura, peso);
    var novoImc = Imc(altura: altura, peso: peso, imc: imc); // Crie o IMC
    _setImc(
        novoImc); // Passe o IMC criado com o id configurado para o método _setImc
    notifyListeners();
  }

  double _calculaImc(double altura, double peso) {
    if (altura <= 0 || peso <= 0) {
      throw ArgumentError("Altura e peso devem ser maiores que zero");
    }
    var imc = peso / (altura * altura);
    return imc;
  }
}
