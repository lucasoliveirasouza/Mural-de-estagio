import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/models/usuario.dart';

class EstudanteService {
  String? cadastrarUsuario(Estudante estudante) {
    try {
      CollectionReference estudantes =
      FirebaseFirestore.instance.collection('estudantes');
      estudantes.add({
        'nome': estudante.nome,
        'email': estudante.email,
        'funcao': estudante.funcao,
        'endereco': estudante.endereco,
        'telefone': estudante.telefone,
        'instituicao': estudante.instituicao,
        'curso': estudante.curso,
        'areaInteresse': estudante.areaInteresse,
      });

      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<Estudante?> getEmpregador(email) async {
    Estudante estudante = Estudante("", "", "", "", "","","","","","");
    try{
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
          estudante.setAreaInteresse(d['areaInteresse']);
          estudante.setCurso(d['curso']);
          estudante.setInstituicao(d['instituicao']);

        }
      });
    }on FirebaseException catch (e) {
      print(e.toString());
    }
    return estudante;
  }
}
