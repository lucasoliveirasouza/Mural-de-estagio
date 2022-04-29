import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:mural_estagio/util/constantes.dart';
import 'package:mural_estagio/views/auth/cadastrar_usuario.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              child: Image.asset("assets/images/diplomado.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Bem-vindo!",
                style: TextStyle(
                  fontSize: 25,
                  color: corPadrao,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: email,
              title: "E-mail",
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    new Radius.circular(10.0),
                  ),
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
                child: Text("Entrar"),
                onPressed: () {
                  login();
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
                  "Cadastre-se",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastrarUsuarioView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
