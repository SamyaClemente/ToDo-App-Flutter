import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_application_1/widgets/paginas/login.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../paginas/tela_inicial.dart';

class BotaoIcon extends StatelessWidget {
  final String icon;
  final String label;
  final double horizontal;

  const BotaoIcon({Key? key, required this.icon, required this.label, this.horizontal = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        UserCredential? userCredential = await Auth().signInWithGoogle(); // Realiza o login com o Google

        if (userCredential?.user != null) {
          // O login foi bem-sucedido, redirecione para a próxima tela
          Navigator.push(
            context,
            PageTransition(child: const TelaInicial(), type: PageTransitionType.bottomToTop),
          );
        }
      },
      icon: SvgPicture.asset(
        icon,
        width: 25,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: horizontal),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: const Color(0xff3e977a),
      ),
    );
  }
}
