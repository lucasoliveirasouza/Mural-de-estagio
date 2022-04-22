class Vaga {
  late String _id;
  late String _idEmpresa, _nomeEmpresa, _descricaoVaga;
  late double _remuneracao;
  late int _horasSemanais;

  Vaga(this._id, this._idEmpresa, this._nomeEmpresa, this._descricaoVaga,
      this._remuneracao, this._horasSemanais);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  int get horasSemanais => _horasSemanais;

  void setHorasSemanais(int value) {
    _horasSemanais = value;
  }

  double get remuneracao => _remuneracao;

  void setRemuneracao(double value) {
    _remuneracao = value;
  }

  get descricaoVaga => _descricaoVaga;

  void setDescricaoVaga(value) {
    _descricaoVaga = value;
  }

  get nomeEmpresa => _nomeEmpresa;

  void setNomeEmpresa(value) {
    _nomeEmpresa = value;
  }

  String get idEmpresa => _idEmpresa;

  void setIdEmpresa(String value) {
    _idEmpresa = value;
  }

  String toString() {
    String retorno = "";

    retorno += 'idEmpresa:' + _idEmpresa + ',';
    retorno += 'nomeEmpresa:' + _nomeEmpresa + ',';
    retorno += 'descricaoVaga:' + _descricaoVaga + ',';
    retorno += 'remuneracao:' + _remuneracao.toString() + ',';
    retorno += 'horasSemanais:' + _horasSemanais.toString() + ',';

    return retorno;
  }
}
