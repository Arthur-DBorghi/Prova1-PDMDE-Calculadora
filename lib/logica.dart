class Logica{
  //Predefine quais os operadores que poderão ser inseridos
  static const ops = ['/', 'x', '-', '+', '='];

  String _numero = '0';
  final _valores = [0.0, 0.0];
  int indice = 0;
  String operador = '';
  bool limpo = false;
  String ultimo = '';

  String get numero{
    return _numero;
  }

  //Função que vai checar o operador e inserir o valor no visor
  void calcular(String v){
    if(_numero == 'ERRO: Divisão por 0'){
      _numero = '0';
    }
    if(impedeOperadorDuplo(v)){
      operador = v;
      return;
    }

    if(v == 'C'){
      limpar();
    }else if(ops.contains(v)){
      criaOperacao(v);
    }else if(v == '<-'){
      delete();
    }else if(v == '%'){
      porcentagem();
    }
    else{
      incrementaVisor(v);
    }

    ultimo = v;
  }

  //Verifica qual o indice do valor que está sendo alterado na instância, realiza a conta e manda pro visor
  porcentagem(){
    double temp = double.parse(_numero);
    temp = temp/100;
    if(indice == 0){
      _valores[0] = temp;
    }else{
      _valores[1] = temp;
    }
    _numero = temp.toString();
  }

  //Deleta o ulltimo digito do visor
  delete(){
    //Separa o valor do visor em uma substring com o tamanho 1 posição menor
    _numero = _numero.substring(0, _numero.length - 1);
    //Verifica o caso de haver apenas um valor no visor, nesse caso, é apresentado o numero 0
    if(_numero.isEmpty){
      _numero = '0';
    }
  }

  impedeOperadorDuplo(String c){
    return ops.contains(ultimo) && ops.contains(c) && ultimo != '=' && c != '='; 
  }

  
  criaOperacao(String op){
    //Verifica se foi inserido um valor ou dois
    if(indice == 0){
      operador = op;
      indice = 1;
      limpo = true;
    }else{
      //Verifica se é uma divisão por 0
      if(operador == '/' && _valores[1] == 0){
        _numero = 'ERRO: Divisão por 0';

        return;
      }

      //Caso dois valores tenham sido inseridos, o primeiro receberá o resultado da operação escolhida
      _valores[0] = operar();
      //O segundo valor é definido para 0
      _valores[1] = 0.0;
      //O visor recebe o resultado da operação
      _numero = _valores[0].toString();
      //Impede que numeros reais tenham uma casa decimal após a virgula
      _numero = _numero.endsWith('.0') ? _numero.split('.')[0] : _numero;
      
      //Define o indice quando o operador de igual é inserido
      bool igual = op == '=';
      operador = igual ? '' : op;
      indice = igual ? 0 : 1;

      limpo = !igual;
    }
  }

  //Função que limpa o visor, os valores inseridos, o operador, o indice
  limpar(){
    _numero = '0';
    _valores[0] = 0.0;
    _valores[1] = 0.0;
    operador = '';
    indice = 0;
    limpo = false;
  }

  //Adiciona os valores ao visor
  incrementaVisor(String d){
    final bool ponto = d =='.';
    final bool apg = (_numero == '0' && !ponto) || limpo;
    final String vazio = ponto ? '0' : '';
    final String valorAtual = apg ? vazio : _numero;
    
    //Permite inserir um ponto sem pressionar o valor 0
    if(ponto && _numero.contains('.') && !apg){
      return;
    }

    //Incrementa o visor com o valor inserido
    _numero = valorAtual + d;
    limpo = false;

    //Define o valor do visor como o valor inserido ou 0
    _valores[indice] = double.tryParse(_numero) ?? 0;
  }

  //Onde são feitas todas as operações disponíveis
  operar(){
    switch(operador){
      case '/': 
        return _valores[0] / _valores[1];
      case 'x': 
        return _valores[0] * _valores[1];
      case '-': 
        return _valores[0] - _valores[1];
      case '+': 
        return _valores[0] + _valores[1];
      case '%':
        return _valores[0] % _valores[1];
      default:
        return _valores[0];
    }
  }
}
