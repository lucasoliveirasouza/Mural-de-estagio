import 'dart:ffi';

import 'package:mural_estagio/models/usuario.dart';

class Estudante extends Usuario {
  late String _instituicao, _curso, _areaInteresse;

  Estudante(
      String id,
      String nome,
      String email,
      String senha,
      String funcao,
      String endereco,
      String telefone,
      String instituicao,
      String curso,
      String areaInteresse)
      : super(id, nome, email, senha, funcao, endereco, telefone) {
    this._instituicao = instituicao;
    this._curso = curso;
    this._areaInteresse = areaInteresse;
  }



  get areaInteresse => _areaInteresse;

  void setAreaInteresse(value) {
    _areaInteresse = value;
  }

  get curso => _curso;

  void setCurso(value) {
    _curso = value;
  }

  String get instituicao => _instituicao;

  void setInstituicao(String value) {
    _instituicao = value;
  }
}
