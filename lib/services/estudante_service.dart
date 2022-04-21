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
        'miniCurriculo': estudante.miniCurriculo,
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
