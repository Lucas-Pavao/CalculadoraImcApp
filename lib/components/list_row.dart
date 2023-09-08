import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  ListRow(
      {super.key, required this.imc, required this.peso, required this.altura});

  double? imc;
  double? peso;
  double? altura;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IMC: $imc'),
            Text('Peso: $peso - Altura: $altura'),
          ],
        ),
      ),
    );
  }
}
