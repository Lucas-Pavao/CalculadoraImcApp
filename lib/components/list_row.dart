import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ListRow extends StatefulWidget {
  ListRow({
    super.key,
    required this.imc,
    required this.peso,
    required this.altura,
    this.isSelected = false,
  });

  double? imc;
  double? peso;
  double? altura;
  bool isSelected;

  @override
  _ListRowState createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  late Color _backgroundColor; // Cor de fundo do item

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.isSelected ? Colors.blue : Colors.white;
  }

  @override
  void didUpdateWidget(covariant ListRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Verifica se o estado do item foi alterado e inicia a animação
    if (widget.isSelected != oldWidget.isSelected) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _backgroundColor = widget.isSelected ? Colors.blue : Colors.white;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Duração da animação
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: _backgroundColor, // Use a variável _backgroundColor aqui
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000).withOpacity(0.4),
              offset: const Offset(0, 7),
              blurRadius: 7,
              spreadRadius: 4,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'IMC: ${widget.imc}',
                  style: TextStyle(
                      color: widget.isSelected ? Colors.white : Colors.black),
                ),
                Text(
                  'Peso: ${widget.peso} - Altura: ${widget.altura}',
                  style: TextStyle(
                      color: widget.isSelected ? Colors.white : Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
