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


  //Função que recebe o valor do botão pressionado e envia para a parte logicar fazer a conta
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
          Visor(valor.numero), //Construtor do visor da calculadora
          Botoes(pressionado), //Construtor de todos os botões da calculadora
        ],
      )
    );
  }
}