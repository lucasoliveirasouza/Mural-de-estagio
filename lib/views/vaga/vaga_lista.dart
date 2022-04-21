import 'package:flutter/material.dart';
import 'package:mural_estagio/views/vaga/vaga_cadastro.dart';

class VagaListaView extends StatefulWidget {
  const VagaListaView({Key? key}) : super(key: key);

  @override
  _VagaListaViewState createState() => _VagaListaViewState();
}

class _VagaListaViewState extends State<VagaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de vagas"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
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
