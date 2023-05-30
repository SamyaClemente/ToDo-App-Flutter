import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(backgroundColor: Color(0xff3e977a), gap: 8, tabs: const [
        GButton(icon: Icons.home, text: 'Home'),
        GButton(icon: Icons.fact_check, text: 'Objetivos'),
        GButton(icon: Icons.settings, text: 'Configurações'),
        GButton(icon: Icons.person, text: 'Perfil'),
      ]),
    );
  }
}
