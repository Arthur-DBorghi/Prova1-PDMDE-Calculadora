import 'package:calculadora/logica.dart';
import 'package:flutter/material.dart';
import 'visor.dart';
import 'botoes.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final Logica valor = Logica();

  pressionado (String v){
    setState(() {
      valor.calcular(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: <Widget>[
          Visor(valor.numero),
          Botoes(pressionado),
        ],
      )
    );
  }
}