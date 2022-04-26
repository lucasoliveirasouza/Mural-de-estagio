import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/services/usuario_service.dart';
import 'package:mural_estagio/views/interesse/interesse_lista.dart';
import 'package:mural_estagio/views/sobre/sobre.dart';
import 'package:mural_estagio/views/vaga/vaga_lista.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int _pagina = 0;

  final List<Widget> _telas = [
    VagaListaView(),
    InteresseListaView(),
    SobreView(),
  ];

  void mudarAba(int indice) {
    setState(() {
      _pagina = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    UsuarioService().getUser(auth.currentUser!.email.toString());
    return Scaffold(
      body: _telas[_pagina],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pagina,
        onTap: mudarAba,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_outlined), label: "Interesses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Sobre"),
        ],
      ),
    );
  }
}
