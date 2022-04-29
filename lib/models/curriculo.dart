class Curriculo {
  late String _emailEstudante,
      _id,
      _curso,
      _instituicao,
      _conhecimentos,
      _diferenciais,
      _referencias;

  Curriculo(this._id, this._emailEstudante, this._curso, this._instituicao,
      this._conhecimentos, this._diferenciais, this._referencias);

  get referencias => _referencias;

  void setReferencias(value) {
    _referencias = value;
  }

  get diferenciais => _diferenciais;

  void setDiferenciais(value) {
    _diferenciais = value;
  }

  get conhecimentos => _conhecimentos;

  void setConhecimentos(value) {
    _conhecimentos = value;
  }

  get instituicao => _instituicao;

  void setInstituicao(value) {
    _instituicao = value;
  }

  get curso => _curso;

  void setCurso(value) {
    _curso = value;
  }

  get id => _id;

  void setId(value) {
    _id = value;
  }

  String get emailEstudante => _emailEstudante;

  void setEmailEstudante(String value) {
    _emailEstudante = value;
  }
}
