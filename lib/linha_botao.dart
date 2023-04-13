import 'package:flutter/material.dart';
import 'cria_botao.dart';

class linha_botao extends StatelessWidget {

  //Cria uma lista de botoes
  final List<CriaBotao> botoes;

  const linha_botao(this.botoes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoes,
      ),
    );
  }
}