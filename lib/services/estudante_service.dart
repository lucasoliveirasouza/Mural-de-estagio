import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/curriculo.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/services/curriculo_service.dart';

class EstudanteService {
  Future<String?> cadastrarEstudante(Estudante estudante) async {
    try {
      Curriculo curriculo = Curriculo("", estudante.email, "", "", "", "", "");
      CurriculoService().cadastrarCurriculo(curriculo);
      String? idCurriculo;

      try {
        QuerySnapshot snapshot =
            await FirebaseFirestore.instance.collection('curriculo').get();
        snapshot.docs.forEach((d) {
          if (d['emailEstudante'] == estudante.email) {
            idCurriculo = d.id;
          }
        });
      } on FirebaseException catch (e) {
        print(e.toString());
      }

      CollectionReference estudantes =
          FirebaseFirestore.instance.collection('estudantes');
      estudantes.add({
        'nome': estudante.nome,
        'email': estudante.email,
        'funcao': estudante.funcao,
        'endereco': estudante.endereco,
        'telefone': estudante.telefone,
        'idCurriculo': idCurriculo,
      });

      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<Estudante?> getEstudante(email) async {
    Estudante estudante = Estudante(
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    );
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('estudantes').get();
      snapshot.docs.forEach((d) {
        if (d['email'] == email) {
          estudante.setId(d.id);
          estudante.setNome(d['nome']);
          estudante.setEmail(d['email']);
          estudante.setFuncao(d['funcao']);
          estudante.setEndereco(d['endereco']);
          estudante.setTelefone(d['telefone']);
          estudante.setIdCurriculo(d['idCurriculo']);
        }
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return estudante;
  }

  String? editarEstudante(Estudante estudante) {
    try {
      var collection = FirebaseFirestore.instance.collection('estudantes');
      collection.doc(estudante.id).update({
        'nome': estudante.nome,
        'endereco': estudante.endereco,
        'telefone': estudante.telefone,
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return "Editado com sucesso!";
  }

  String? candidatarVaga(String idEstudante, String idVaga, String idEmpresa) {
    try {
      CollectionReference estudantes =
          FirebaseFirestore.instance.collection('interesses');
      estudantes.add({
        'estudante': idEstudante,
        'vaga': idVaga,
        'empresa': idEmpresa,
      });

      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }
}
