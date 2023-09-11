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
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    CalculadoraController();
  }

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
                          bool isSelected = _selectedIndex == index;
                          return GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    SnackBar(
                                      content: const Text('Excluir IMC?'),
                                      action: SnackBarAction(
                                        label: 'Excluir',
                                        onPressed: () {
                                          // Remova o item da lista quando a ação for pressionada
                                          setState(() {
                                            _selectedIndex =
                                                -1; // Ressalta a cor para o branco
                                          });
                                          controller.removerImc(imc.id!);
                                        },
                                      ),
                                    ),
                                  )
                                  .closed
                                  .then((reason) {
                                if (reason != SnackBarClosedReason.action) {
                                  // A Snackbar foi fechada sem acionar a ação
                                  setState(() {
                                    _selectedIndex =
                                        -1; // Ressalta a cor para o branco
                                  });
                                }
                              });
                            },
                            child: ListRow(
                              imc: imc.imc,
                              peso: imc.peso,
                              altura: imc.altura,
                              isSelected: isSelected,
                            ),
                          );
                        });
              },
            ),
          ),
        ));
  }
}
