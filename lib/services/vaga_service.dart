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

  Future<List<Vaga?>?> getAll() async {
    List<Vaga> vagas = [];
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('vagas').get();
      snapshot.docs.forEach((d) {
        Vaga vaga = Vaga(d.id, d["idEmpresa"], d["nomeEmpresa"],
            d["descricaoVaga"], d["remuneracao"], d["horasSemanais"]);
        vagas.add(vaga);
      });
      return vagas;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return vagas;
  }
}
