import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyAppTest());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          appBar: AppBar(),
          body: Container(
            color: Colors.green,
            child: Text("Olá"),
          ),
        ));
  }
}

class MyAppTest extends StatefulWidget {
  const MyAppTest({Key? key}) : super(key: key);

  @override
  _MyAppTestState createState() => _MyAppTestState();
}

class _MyAppTestState extends State<MyAppTest> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .add({
            'full_name': 'lucas',
            'company': 'brasil',
            'age': '31',
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return MaterialApp(
        home: TextButton(
            onPressed: () {
              addUser();
            },
            child: Text(
              "Add User",
            )));
  }
}
