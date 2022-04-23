import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/vaga_service.dart';
import 'package:mural_estagio/views/vaga/vaga.dart';
import 'package:mural_estagio/views/vaga/vaga_cadastro.dart';

class VagaListaView extends StatefulWidget {
  const VagaListaView({Key? key}) : super(key: key);

  @override
  _VagaListaViewState createState() => _VagaListaViewState();
}

class _VagaListaViewState extends State<VagaListaView> {
  @override
  Widget build(BuildContext context) {
    Future<List<Vaga?>?> futureList = VagaService().getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de vagas"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15, top: 10),
        child: FutureBuilder(
            future: futureList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Vaga?>?> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        child: Card(
                          color: Colors.deepPurple.shade50,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.deepPurple,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  snapshot.data![index]!.nomeEmpresa,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Colors.deepPurple,
                                ),
                                subtitle: Text("Valor: RS " +
                                    snapshot.data![index]!.remuneracao
                                        .toString()),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => VagaView(vaga: snapshot.data![index]!)));
                                },
                              ),
                              Divider(
                                color: Colors.deepPurple,
                              ),
                              ListTile(
                                title: Text(
                                  snapshot.data![index]!.descricaoVaga,
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => VagaView(vaga: snapshot.data![index]!)));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                }),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VagaCadastroView(),
            ),
          );
        },
      ),
    );
  }
}
