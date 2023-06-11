import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/widgets/paginas/login.dart';

class TelaUser extends StatelessWidget {
  const TelaUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await FirebaseAuth.instance.signOut();
          // Navegar para a tela de login ou tela inicial, por exemplo
          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
        } catch (e) {
          // Lidar com erros, se necessário
          print('Erro ao fazer logout: $e');
        }
      },
      child: const Text('Logout'),
    );
  }
}
