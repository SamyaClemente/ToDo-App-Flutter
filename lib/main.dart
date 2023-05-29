import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 204),

        // scaffoldBackgroundColor: LinearGradient(colors: ()).
        useMaterial3: true,
      ),
      //home: const TelaLogin(),
      // home: const Registro(),
      home: const Home(),
    );
  }
}
