import 'package:mural_estagio/models/usuario.dart';

class Empregador extends Usuario {
  late String _descricaoEmpresa;

  Empregador(String id, String nome, String email, String senha, String funcao,
      String endereco, String telefone, descricaoEmpresa)
      : super(id, nome, email, senha, funcao, endereco, telefone) {
    this._descricaoEmpresa = descricaoEmpresa;
  }

  String get descricaoEmpresa => _descricaoEmpresa;

  void setDescricaoEmpresa(String value) {
    _descricaoEmpresa = value;
  }
}
