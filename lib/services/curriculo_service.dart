

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/curriculo.dart';

class CurriculoService{

  String? cadastrarCurriculo(Curriculo curriculo) {
    try {
      CollectionReference curriculoColecao =
      FirebaseFirestore.instance.collection('curriculo');
      curriculoColecao.add({
        'id': curriculo.id,
        'emailEstudante': curriculo.emailEstudante,
        'curso': curriculo.curso,
        'instituicao': curriculo.instituicao,
        'conhecimentos': curriculo.conhecimentos,
        'diferenciais': curriculo.diferenciais,
        'referencias': curriculo.referencias,
      });

      return "Cadastrado";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<Curriculo?> getCurriculo(emailEstudante) async {
    Curriculo curriculo = Curriculo("", "", "", "", "", "", "");
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('curriculo').get();
      snapshot.docs.forEach((d) {
        if (d['emailEstudante'] == emailEstudante) {
          curriculo.setId(d.id);
          curriculo.setEmailEstudante(d['emailEstudante']);
          curriculo.setCurso(d['curso']);
          curriculo.setInstituicao(d['instituicao']);
          curriculo.setConhecimentos(d['conhecimentos']);
          curriculo.setDiferenciais(d['diferenciais']);
          curriculo.setReferencias(d['referencias']);
        }
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return curriculo;
  }

  String? editarCurriculo(Curriculo curriculo) {
    try {
      var collection = FirebaseFirestore.instance.collection('curriculo');
      collection.doc(curriculo.id).update(
        {
          'id': curriculo.id,
          'emailEstudante': curriculo.emailEstudante,
          'curso': curriculo.curso,
          'instituicao': curriculo.instituicao,
          'conhecimentos': curriculo.conhecimentos,
          'diferenciais': curriculo.diferenciais,
          'referencias': curriculo.referencias,
        }
      );
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return "Tudo ok";
  }
}