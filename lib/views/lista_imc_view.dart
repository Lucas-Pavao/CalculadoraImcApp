import 'package:calculadorimcapp/components/list_row.dart';
import 'package:calculadorimcapp/controllers/calculadora_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaImcView extends StatefulWidget {
  const ListaImcView({super.key});

  @override
  State<ListaImcView> createState() => _ListaImcViewState();
}

class _ListaImcViewState extends State<ListaImcView> {
  late CalculadoraController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<CalculadoraController>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de IMC'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(12),
            child: Consumer<CalculadoraController>(
              builder: (context, controller, child) {
                return controller.imcs.isEmpty
                    ? const Center(
                        child: Text('Nenhum IMC calculado'),
                      )
                    : ListView.builder(
                        itemCount: controller.imcs.length,
                        itemBuilder: (_, index) {
                          var imc = controller.imcs[index];
                          return ListRow(
                              imc: imc.imc,
                              peso: imc.weight,
                              altura: imc.height);
                        });
              },
            ),
          ),
        ));
  }
}
