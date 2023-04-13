class Logica{
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

  void calcular(String v){

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
    }else{
      incrementaVisor(v);
    }

    ultimo = v;
  }

  delete(){
    _numero = _numero.substring(0, _numero.length - 1);
    if(_numero.isEmpty){
      _numero = '0';
    }
  }

  impedeOperadorDuplo(String c){
    return ops.contains(ultimo) && ops.contains(c) && ultimo != '=' && c != '='; 
  }

  criaOperacao(String op){
    if(indice == 0){
      operador = op;
      indice = 1;
      limpo = true;
    }else{
      _valores[0] = operar();
      _valores[1] = 0.0;
      _numero = _valores[0].toString();
      _numero = _numero.endsWith('.0') ? _numero.split('.')[0] : _numero;
      
      bool igual = op == '=';
      operador = igual ? '' : op;
      indice = igual ? 0 : 1;

      limpo = !igual;
    }
  }

  limpar(){
    _numero = '0';
    _valores[0] = 0.0;
    _valores[1] = 0.0;
    operador = '';
    indice = 0;
    limpo = false;
  }

  incrementaVisor(String d){
    final ponto = d =='.';
    final apg = (_numero == '0' && !ponto) || limpo;
    final vazio = ponto ? '0' : '';
    final valorAtual = apg ? vazio : _numero;
    
    if(ponto && _numero.contains('.') && !apg){
      return;
    }

    _numero = valorAtual + d;
    limpo = false;

    _valores[indice] = double.tryParse(_numero) ?? 0;
  }

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
      default:
        return _valores[0];
    }
  }
}