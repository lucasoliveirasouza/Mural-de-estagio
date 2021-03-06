import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/empregador.dart';

class EmpregadorService {
  String? cadastrarEmpregador(Empregador empregador) {
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

  Future<Empregador?> getEmpregador(email) async {
    Empregador empregador = Empregador("", "", "", "", "", "", "", "");
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('empregadores').get();
      snapshot.docs.forEach((d) {
        if (d['email'] == email) {
          empregador.setId(d.id);
          empregador.setNome(d['nome']);
          empregador.setEmail(d['email']);
          empregador.setFuncao(d['funcao']);
          empregador.setEndereco(d['endereco']);
          empregador.setTelefone(d['telefone']);
        }
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return empregador;
  }

  String? editarEmpregador(Empregador empregador) {
    try {
      var collection = FirebaseFirestore.instance.collection('empregadores');
      collection.doc(empregador.id).update({
        'nome': empregador.nome,
        'endereco': empregador.endereco,
        'telefone': empregador.telefone,
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return "Editado com sucesso!";
  }
}
