import 'package:flutter/material.dart';
import 'package:mural_estagio/models/usuario.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:mural_estagio/services/usuario_service.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';
import 'package:provider/provider.dart';

class CadastrarUsuarioView extends StatefulWidget {
  const CadastrarUsuarioView({Key? key}) : super(key: key);

  @override
  _CadastrarUsuarioViewState createState() => _CadastrarUsuarioViewState();
}

class _CadastrarUsuarioViewState extends State<CadastrarUsuarioView> {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();
  final endereco = TextEditingController();
  final telefone = TextEditingController();

  String funcao = "Selecione uma função...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          right: 50,
          left: 50,
          top: 30,
        ),
        child: ListView(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/images/estagio.png"),
            ),
            SizedBox(
              height: 15,
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
              height: 15,
            ),
            FormFieldPadrao(
              controle: nome,
              title: "Nome",
            ),
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: email,
              title: "E-mail",
            ),
            SizedBox(
              height: 15,
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
              height: 15,
            ),
            TextFormField(
              controller: confirmarSenha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: DropdownButtonFormField<String>(
                value: funcao,
                icon: Icon(null),
                elevation: 15,
                decoration: InputDecoration(
                  labelText: 'Tipo:',
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    funcao = newValue!;
                  });
                },
                items: <String>[
                  'Selecione uma função...',
                  'Empregador',
                  'Estudante',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: endereco,
              title: "Endereço",
            ),
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: telefone,
              title: "Telefone",
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
                  Usuario usuario =
                      Usuario("",nome.text, email.text, senha.text, funcao,endereco.text,telefone.text);
                  print(usuario);
                  UsuarioService().cadastrarUsuario(usuario);

                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 10,
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
