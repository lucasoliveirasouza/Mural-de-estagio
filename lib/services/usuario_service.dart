import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/empregador.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/models/usuario.dart';
import 'package:mural_estagio/services/empregador_service.dart';
import 'package:mural_estagio/services/estudante_service.dart';

class UsuarioService {
  String? cadastrarUsuario(Usuario usuario) {
    try {
      print("CADASTRADO");
      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('usuarios');
      usuarios.add({
        'nome': usuario.nome,
        'email': usuario.email,
        'funcao': usuario.funcao,
        'endereco': usuario.endereco,
        'telefone': usuario.telefone,
      });

      if (usuario.funcao == "Estudante") {
        Estudante estudante = Estudante("", usuario.nome, usuario.email, "",
            usuario.funcao, usuario.endereco, usuario.telefone, "", "", "", "");
        EstudanteService().cadastrarUsuario(estudante);
      } else if (usuario.funcao == "Empregador") {
        Empregador empregador = Empregador("", usuario.nome, usuario.email, "",
            usuario.funcao, usuario.endereco, usuario.telefone, "");
        EmpregadorService().cadastrarUsuario(empregador);
      }
      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<Usuario?> getUser(email) async {
    Usuario usuario = Usuario("", "", "", "", "", "", "");
    try {
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
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return usuario;
  }
}
