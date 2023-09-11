import 'package:calculadorimcapp/controllers/calculadora_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculadoraView extends StatefulWidget {
  const CalculadoraView({super.key});

  @override
  State<CalculadoraView> createState() => _CalculadoraViewState();
}

class _CalculadoraViewState extends State<CalculadoraView> {
  FocusNode pesoFocusNode = FocusNode();
  FocusNode alturaFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final CalculadoraController controller =
        Provider.of<CalculadoraController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Peso (kg)',
            labelStyle: TextStyle(fontSize: 20),
          ),
          style: const TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
          controller: controller.pesoController,
          focusNode: pesoFocusNode,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Altura (cm)',
            labelStyle: TextStyle(fontSize: 20),
          ),
          style: const TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
          controller: controller.alturaController,
          focusNode: alturaFocusNode,
        ),
        ElevatedButton(
          onPressed: () {
            controller.calcular();
            pesoFocusNode.unfocus();
            alturaFocusNode.unfocus();
          },
          child: const Text('Calcular'),
        ),
      ]),
    );
  }
}
