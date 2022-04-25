import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/vaga_service.dart';
import 'package:mural_estagio/views/vaga/vaga.dart';
import 'package:mural_estagio/views/vaga/vaga_cadastro.dart';
import 'package:mural_estagio/widgets/card_item.dart';

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
        title: Text("Olá, estudante"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 70, left: 70, top: 15),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VagaView(vaga: snapshot.data![index]!)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.email,
                                size: 30,
                                color: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                snapshot.data![index]!.nomeEmpresa,
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "BOLSA: " +
                                    snapshot.data![index]!.remuneracao
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "LOCAL: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Center(
                              child: Text(
                                "VER MAIS",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
