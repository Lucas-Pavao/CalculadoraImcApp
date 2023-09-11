// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Imc {
  int? id;
  double altura;
  double peso;
  double imc;
  Imc({
    this.id,
    required this.altura,
    required this.peso,
    required this.imc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'altura': altura,
      'peso': peso,
      'imc': imc,
    };
  }

  factory Imc.fromMap(Map<String, dynamic> map) {
    return Imc(
      id: map['id'] as int?,
      altura: map['altura'] as double,
      peso: map['peso'] as double,
      imc: map['imc'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Imc.fromJson(String source) =>
      Imc.fromMap(json.decode(source) as Map<String, dynamic>);
}
