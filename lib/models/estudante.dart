import 'package:mural_estagio/models/usuario.dart';

class Estudante extends Usuario {
  late String _idCurriculo;

  Estudante(String id, String nome, String email, String senha, String funcao,
      String endereco, String telefone, String idCurriculo)
      : super(id, nome, email, senha, funcao, endereco, telefone) {
    this._idCurriculo = idCurriculo;
  }

  get idCurriculo => _idCurriculo;

  void setIdCurriculo(value) {
    _idCurriculo = value;
  }
}
