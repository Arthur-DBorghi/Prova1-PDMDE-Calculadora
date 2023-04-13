import 'package:flutter/material.dart';
import 'cria_botao.dart';
import 'linha_botao.dart';


class Botoes extends StatelessWidget {

  final void Function(String) valBotao;

  const Botoes(this.valBotao, {super.key});

  //Construção e estilização dos botões
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Define a altura máxima do teclado para 60% da tela do aparelho
      height: MediaQuery.of(context).size.height * 0.60,
      child: Column(
        children: <Widget> [
          //Criação das linhas de botões, definindo imagem do botão, valor, tipo, tamanho
          linha_botao([
            CriaBotao(botao: 'C', operacao: true, resposta: valBotao,),
            CriaBotao(botao: '<-', operacao: true, resposta: valBotao,),
            CriaBotao(botao: '%', operacao: true, resposta: valBotao,),
            CriaBotao(botao: '/', operacao: true, resposta: valBotao,),
          ]),
          linha_botao([
            CriaBotao(botao: '7', resposta: valBotao,),
            CriaBotao(botao: '8', resposta: valBotao,),
            CriaBotao(botao: '9', resposta: valBotao,),
            CriaBotao(botao: 'x', operacao: true, resposta: valBotao,),
          ]),
          linha_botao([
            CriaBotao(botao: '4', resposta: valBotao,),
            CriaBotao(botao: '5', resposta: valBotao,),
            CriaBotao(botao: '6', resposta: valBotao,),
            CriaBotao(botao: '-', operacao: true, resposta: valBotao,),
          ]),
          linha_botao([
            CriaBotao(botao: '1', resposta: valBotao,),
            CriaBotao(botao: '2', resposta: valBotao,),
            CriaBotao(botao: '3', resposta: valBotao,),
            CriaBotao(botao: '+', operacao: true, resposta: valBotao,),
          ]),
          linha_botao([
            CriaBotao(botao: '0', duplo: true, resposta: valBotao,),
            CriaBotao(botao: '.', resposta: valBotao,),
            CriaBotao(botao: '=', operacao: true, resposta: valBotao,),
          ])
        ],
      ),
    );
  }
}
