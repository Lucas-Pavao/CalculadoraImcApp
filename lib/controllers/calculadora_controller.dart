import 'dart:collection';
import 'package:calculadorimcapp/models/imc_model.dart';
import 'package:flutter/material.dart';

class CalculadoraController extends ChangeNotifier {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final List<Imc> _imcs = [];

  UnmodifiableListView<Imc> get imcs => UnmodifiableListView(_imcs);

  calcular() {
    var peso = double.parse(pesoController.text);
    var altura = double.parse(alturaController.text) / 100;
    var imc = _calculaImc(altura, peso);
    _imcs.add(Imc(height: altura, weight: peso, imc: imc));
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
