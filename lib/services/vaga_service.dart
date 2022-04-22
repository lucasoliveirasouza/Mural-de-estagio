import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_estagio/models/vaga.dart';

class VagaService {
  String? cadastrarVaga(Vaga vaga) {
    try {
      CollectionReference vagas =
          FirebaseFirestore.instance.collection('vagas');
      vagas.add({
        'idEmpresa': vaga.idEmpresa,
        'nomeEmpresa': vaga.nomeEmpresa,
        'descricaoVaga': vaga.descricaoVaga,
        'remuneracao': vaga.remuneracao,
        'horasSemanais': vaga.horasSemanais,
      });

      return "Cadastrado com sucesso!";
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }
}
