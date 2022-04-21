import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:mural_estagio/views/empresa/empresa_lista.dart';
import 'package:mural_estagio/views/interesse/interesse_lista.dart';
import 'package:mural_estagio/views/sobre/sobre.dart';
import 'package:mural_estagio/views/vaga/vaga_lista.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _pagina = 0;


  final List<Widget> _telas = [
    VagaListaView(),
    EmpresaListaView(),
    InteresseListaView (),
    SobreView(),
  ];

  void mudarAba(int indice) {
    setState(() {
      _pagina = indice;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _telas[_pagina],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pagina,
        onTap: mudarAba,
        items: [
          BottomNavigationBarItem(

              icon: Icon(Icons.home),
              label: "Início"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Empresas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_on),
              label: "Interesses"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Sobre"
          ),

        ],
      ),
    );
  }
}
