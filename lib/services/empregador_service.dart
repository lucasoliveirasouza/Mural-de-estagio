import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/empregador.dart';

import 'package:mural_estagio/models/usuario.dart';

class EmpregadorService {
  String? cadastrarUsuario(Empregador empregador) {
    try {
      CollectionReference empregadores =
      FirebaseFirestore.instance.collection('empregadores');
      empregadores.add({
        'nome': empregador.nome,
        'email': empregador.email,
        'funcao': empregador.funcao,
        'endereco': empregador.endereco,
        'telefone': empregador.telefone,
        'descricaoEmpresa': empregador.descricaoEmpresa,

      });

      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<Usuario?> getUser(email) async {
    Usuario usuario = Usuario("", "", "", "", "","","");
    try{
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('usuarios').get();
      snapshot.docs.forEach((d) {
        if (d['email'] == email) {
          usuario.setId(d.id);
          usuario.setNome(d['nome']);
          usuario.setEmail(d['email']);
          usuario.setFuncao(d['funcao']);
          usuario.setEndereco(d['endereco']);
          usuario.setTelefone(d['telefone']);
        }
      });
    }on FirebaseException catch (e) {
      print(e.toString());
    }
    return usuario;
  }
}
