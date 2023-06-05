import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/paginas/registro.dart';
import 'package:flutter_application_1/widgets/botoes/botao_icon.dart';
import 'package:flutter_application_1/widgets/botoes/botao_register.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
          width: 500,
          child: Column(
            children: <Widget>[
              SizedBox(height: 250),
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                  height: 7,
                ),
              ),
              const BotaoIcon(
                icon: 'assets/svg/g_logo.svg',
                label: 'Entrar com o Google',
                horizontal: 60,
              ),
              const SizedBox(
                height: 13,
              ),
              const BotaoIconRegister(
                icon: 'assets/svg/email-icon.svg',
                label: 'Entrar com o E-mail',
                horizontal: 60,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(context, PageTransition(child: const Registro(), type: PageTransitionType.leftToRight));
                },
                child: const Text(
                  'Não tem uma conta? Inscrever-se',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
