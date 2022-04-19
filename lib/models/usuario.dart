class Usuario {
  late String _nome, _email, _senha, _funcao;

  Usuario(this._nome, this._email, this._senha, this._funcao);

  get funcao => _funcao;

  set funcao(value) {
    _funcao = value;
  }

  get senha => _senha;

  set senha(value) {
    _senha = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
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
