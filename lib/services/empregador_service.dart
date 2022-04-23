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

}
