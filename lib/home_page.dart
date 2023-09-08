import 'package:calculadorimcapp/views/calculadora_view.dart';
import 'package:calculadorimcapp/views/lista_imc_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: const [
          CalculadoraView(),
          ListaImcView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calculadora'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lista IMC'),
        ],
        onTap: (index) {
          pc.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
