import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:provider/provider.dart';

class CadastrarUsuarioView extends StatefulWidget {
  const CadastrarUsuarioView({Key? key}) : super(key: key);

  @override
  _CadastrarUsuarioViewState createState() => _CadastrarUsuarioViewState();
}

class _CadastrarUsuarioViewState extends State<CadastrarUsuarioView> {
  final senha = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          right: 50,
          left: 50,
          top: 100,
        ),
        child: ListView(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/images/estagio.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Realizar cadastro",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: senha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 50, left: 50),
              child: ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  registrar();
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  "Voltar ao Login",
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
