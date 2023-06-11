import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/widgets/paginas/home.dart';
import 'package:flutter_application_1/widgets/paginas/login.dart';
import 'package:flutter_application_1/widgets/paginas/tela_inicial.dart';
import 'package:page_transition/page_transition.dart';

import '../botoes/botao_icon.dart';
import '../botoes/botao_tela_inicial.dart';

class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _Registro();
}

class _Registro extends State<Registro> {
  final User? user = Auth().currentUser;
  bool registrationSuccess = false;
  bool isLoading = false; // Variável de estado para controlar o indicador de carregamento

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    setState(() {
      isLoading = true; // Ativa o indicador de carregamento
    });

    try {
      registrationSuccess = true;

      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }

    setState(() {
      isLoading = false; // Desativa o indicador de carregamento após a conclusão da operação
    });
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(border: const OutlineInputBorder(), labelText: title),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: isLoading
          ? null
          : () async {
              await createUserWithEmailAndPassword();

              if (registrationSuccess) {
                // Exibir a mensagem de "registrado com sucesso"
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Registrado com sucesso'),
                    content: const Text('Seu registro foi concluído com sucesso.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Fechar o diálogo
                          // Fazer o login automaticamente após o registro
                          Navigator.pushAndRemoveUntil(context, PageTransition(child: TelaLogin(), type: PageTransitionType.leftToRight), ModalRoute.withName("/login"));
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
      child: isLoading
          ? CircularProgressIndicator() // Exibe o indicador de carregamento durante o registro
          : const Text('Registrar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF238369),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              height: 450,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 20)
              ], color: Color(0xFFE4E9E8), borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
              child: Center(
                child: Column(children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Registro',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _entryField('E-mail', _controllerEmail),
                  const SizedBox(
                    height: 15,
                  ),
                  _entryField('Password', _controllerPassword),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[]),
                  _errorMessage(),
                  _submitButton(),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(context, PageTransition(child: const Home(), type: PageTransitionType.leftToRight));
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Color(0xFF238369),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
