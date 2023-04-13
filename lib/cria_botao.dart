import 'package:flutter/material.dart';


class CriaBotao extends StatelessWidget {

  final String botao;
  final bool duplo;
  final bool operacao;
  final void Function(String) resposta;
  static const Icon iconeVoltar = Icon(Icons.backspace_outlined, color: Colors.orange,);

  CriaBotao({super.key, 
    required this.botao,
    this.duplo = false,
    this.operacao = false,
    required this.resposta,
    });

  
  @override
  Widget build(BuildContext context) {
    if(botao == '<-'){
      return Expanded(
        flex: 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () => resposta(botao),
          child:const Icon(Icons.backspace_outlined, color: Colors.orange,),
          ),
        );
    }else{
      return Expanded(
      flex: duplo ? 2 : 1 ,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),        
        onPressed: () => resposta(botao),
        child: Text(
          botao,
          style: TextStyle(
            color: operacao ? Colors.orange : Colors.white, 
            fontSize: 35, 
            fontWeight: FontWeight.w400
          ),
        ),
      )
      );
    }
  }
}