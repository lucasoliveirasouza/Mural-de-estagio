import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/usuario.dart';

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
      });
      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }
}
