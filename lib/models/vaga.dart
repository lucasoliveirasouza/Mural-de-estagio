
class Vaga{
  late String _idEmpresa, _nomeEmpresa, _descricaoVaga;
  late double _remuneracao;
  late int _horasSemanais;

  Vaga(this._idEmpresa, this._nomeEmpresa, this._descricaoVaga,
      this._remuneracao, this._horasSemanais);

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
}