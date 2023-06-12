import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/paginas/tela_inicial.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget userUid() {
    return Text(user?.email ?? 'User email');
  }

  String? errorMessage = '';
  bool isLogin = true;
  bool isLoading = false; // Variável de estado para controlar o indicador de carregamento

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailandPassword() async {
    setState(() {
      isLoading = true; // Ativa o indicador de carregamento
    });

    try {
      await Auth().signInWithEmailAndPassword(
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

  Future<void> createUserWithEmailAndPassword() async {
    setState(() {
      isLoading = true; // Ativa o indicador de carregamento
    });

    try {
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
          obscureText: title == 'Password',
          decoration: InputDecoration(border: OutlineInputBorder(), labelText: title),
        ));
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: isLoading ? null : signInWithEmailandPassword, // Desabilita o botão durante o carregamento
      child: isLoading
          ? const CircularProgressIndicator() // Exibe o indicador de carregamento quando isLoading é verdadeiro
          : const Text('Entrar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1ea181),
                    Color(0xff1e6951),
                    Color(0xff183e2c),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black87, spreadRadius: 1, blurRadius: 30)
                    ],
                    color: Color(0xFFE4E9E8),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
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
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
