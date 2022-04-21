import 'package:flutter/material.dart';

class FormFieldPadrao extends StatelessWidget {
  TextEditingController controle;
  String title;

  FormFieldPadrao({
    Key? key,
    required this.controle,
    required this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: title,
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
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
