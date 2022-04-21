class Usuario {
  late String _nome, _email, _senha, _funcao, _id;

  Usuario(this._id,this._nome, this._email, this._senha, this._funcao);

  get id => _id;

  void setId(value) {
    _id = value;
  }

  get funcao => _funcao;

  void setFuncao(String value) {
    _funcao = value;
  }


  void senha(String value) {
    _senha = value;
  }

  get email => _email;

  void setEmail(String value) {
    _email = value;
  }

  String get nome => _nome;

  void setNome(String value) {
    _nome = value;
  }

  String toString() {
    String retorno = "";

    retorno += 'nome:' + _nome + ',';
    retorno += 'email:' + _email + ',';
    retorno += 'senha:' + _senha + ',';
    retorno += 'funcao:' + _funcao + ',';

    return retorno;
  }




}
