import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: <Widget>[
        const SizedBox(height: 50),
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset('assets/svg/registro.png'),
        ),
        const SizedBox(height: 50),
        const Text(
          'Registro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        const SizedBox(height: 15),
        const SizedBox(
          width: 250,
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome',
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          width: 250,
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          width: 250,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          SizedBox(height: 15),
          FilledButton.tonal(
            onPressed: null,
            child: Text('Entrar'),
          ),
          Text(
            'ou',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          FilledButton.tonal(
            onPressed: null,
            child: Text('Cancelar'),
          ),
          SizedBox(height: 30),
        ]),
        const Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          SizedBox(height: 15),
        ]),
      ]),
    ));
  }
}
