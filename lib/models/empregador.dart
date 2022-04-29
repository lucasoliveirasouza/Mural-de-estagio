import 'package:mural_estagio/models/usuario.dart';
import 'package:mural_estagio/models/vaga.dart';

class Empregador extends Usuario {
  late String _descricaoEmpresa;

  List<Vaga> vagas = [];

  Empregador(String id, String nome, String email, String senha, String funcao,
      String endereco, String telefone, descricaoEmpresa)
      : super(id, nome, email, senha, funcao, endereco, telefone) {
    this._descricaoEmpresa = descricaoEmpresa;
  }

  String get descricaoEmpresa => _descricaoEmpresa;

  void setDescricaoEmpresa(String value) {
    _descricaoEmpresa = value;
  }

  void adicionarVaga(Vaga vaga){
    vagas.add(vaga);
  }
}
