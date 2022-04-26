class Vaga {
  late String _id;
  late String _idEmpresa;
  late String _nomeEmpresa;
  late String _nivel;
  late String _cursos;
  late double _remuneracao;
  late String _local;
  late String _requisitoEscolaridade;
  late String _periodo;
  late String _descricaoVaga;
  late String _informacoesAdicionais;

  Vaga(
      this._id,
      this._idEmpresa,
      this._nomeEmpresa,
      this._nivel,
      this._cursos,
      this._remuneracao,
      this._local,
      this._requisitoEscolaridade,
      this._periodo,
      this._descricaoVaga,
      this._informacoesAdicionais);

  String get informacoesAdicionais => _informacoesAdicionais;

  set informacoesAdicionais(String value) {
    _informacoesAdicionais = value;
  }

  String get descricaoVaga => _descricaoVaga;

  set descricaoVaga(String value) {
    _descricaoVaga = value;
  }

  String get periodo => _periodo;

  set periodo(String value) {
    _periodo = value;
  }

  String get requisitoEscolaridade => _requisitoEscolaridade;

  set requisitoEscolaridade(String value) {
    _requisitoEscolaridade = value;
  }

  String get local => _local;

  set local(String value) {
    _local = value;
  }

  double get remuneracao => _remuneracao;

  set remuneracao(double value) {
    _remuneracao = value;
  }

  String get cursos => _cursos;

  set cursos(String value) {
    _cursos = value;
  }

  String get nomeEmpresa => _nomeEmpresa;

  set nomeEmpresa(String value) {
    _nomeEmpresa = value;
  }

  String get idEmpresa => _idEmpresa;

  set idEmpresa(String value) {
    _idEmpresa = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
