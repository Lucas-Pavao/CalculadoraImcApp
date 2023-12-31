import 'package:calculadorimcapp/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/calculadora_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculadoraController(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(
            secondary: Colors.amber,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const CalculadoraImc(),
      ),
    ),
  );
}

class CalculadoraImc extends StatelessWidget {
  const CalculadoraImc({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
