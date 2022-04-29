class Usuario {
  late String _id, _nome, _email, _senha, _funcao, _endereco, _telefone;

  Usuario(this._id, this._nome, this._email, this._senha, this._funcao,
      this._endereco, this._telefone);

  get id => _id;

  void setId(value) {
    _id = value;
  }

  get funcao => _funcao;

  void setFuncao(String value) {
    _funcao = value;
  }

  get senha => _senha;

  void setSenha(String value) {
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

  get endereco => _endereco;

  void setEndereco(value) {
    _endereco = value;
  }

  get telefone => _telefone;

  void setTelefone(value) {
    _telefone = value;
  }
}
