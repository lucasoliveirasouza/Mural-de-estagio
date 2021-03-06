import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/curriculo.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/curriculo_service.dart';
import 'package:mural_estagio/services/usuario_service.dart';

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

  String? candidatarVaga(String emailEstudante, String idVaga, String idEmpresa, String cursos,String nomeEmpresa, double remuneracao) {
    try {
      CollectionReference estudantes =
          FirebaseFirestore.instance.collection('interesses');
      estudantes.add({
        'estudante': emailEstudante,
        'vaga': idVaga,
        'empresa': idEmpresa,
        'cursos': cursos,
        'nomeEmpresa': nomeEmpresa,
        'remuneracao': remuneracao,
      });

      return "Voc?? se canditatou a essa vaga";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<List<Vaga?>?> getVagas() async {
    List<Vaga> vagas = [];
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('interesses').get();
      snapshot.docs.forEach((d) {
        if(UsuarioService().getUsuario()?.email == d["estudante"]){
          Vaga vaga = Vaga(d["vaga"], d["empresa"], d["nomeEmpresa"], d["cursos"], d["remuneracao"], "", "", "", "", "");
            vagas.add(vaga);
        }

      });
      return vagas;

    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return vagas;
  }
}
