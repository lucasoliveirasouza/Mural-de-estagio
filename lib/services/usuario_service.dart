import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioService {
  String? cadastrarUsuario(usuario) {
    try {
      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('usuarios');
      usuarios.add({usuario});
      return "Usuario cadastrado";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
