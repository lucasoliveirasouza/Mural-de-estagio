import 'dart:ffi';

import 'package:mural_estagio/models/usuario.dart';

class Estudante extends Usuario {
  late String _instituicao, _curso, _areaInteresse, _idCurriculo;

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
      String areaInteresse,
      String idCurriculo)
      : super(id, nome, email, senha, funcao, endereco, telefone) {
    this._instituicao = instituicao;
    this._curso = curso;
    this._areaInteresse = areaInteresse;
    this._idCurriculo = idCurriculo;
  }

  get idCurriculo => _idCurriculo;

  void setIdCurriculo(value) {
    _idCurriculo = value;
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
