import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo"),
      ),
      body: TextButton(
        onPressed: () {
          AuthService().logout();
        },
        child: Text("Logout"),
      ),
    );
  }
}
