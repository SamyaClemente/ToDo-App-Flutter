import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/svg/conexao.png'),
          ),
          const SizedBox(height: 50),
          const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 50),
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
            height: 20,
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            SizedBox(height: 50),
            FilledButton.tonal(
              onPressed: null,
              child: Text('Entrar'),
            ),
            SizedBox(height: 30),
          ]),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {},
            child: const Text(
              'Esqueceu a senha?',
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ))),
    ));
  }
}
