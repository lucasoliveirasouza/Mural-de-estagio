import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:mural_estagio/util/constantes.dart';
import 'package:mural_estagio/views/auth/auth_check.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mural de estágio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: corPadrao,
      ),
      home: AuthCheck(),
    );
  }
}
