import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(tabs: const [
        GButton(icon: Icons.home),
        GButton(icon: Icons.check),
        GButton(icon: Icons.settings),
        GButton(icon: Icons.settings)
      ]),
    );
  }
}
