import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/paginas/TelaAddCard.dart';
import 'package:flutter_application_1/widgets/paginas/login.dart';
import 'package:flutter_application_1/widgets/paginas/calendarioObjetivos.dart';

import 'Teste.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CalendarPage(), //1 page
    TelaAddCard(), //2 page
    TestePage(), //3 page
    const TelaLogin() //4 page
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff3e977a),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color(0xff3e977a),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fact_check),
                  label: 'Objetivos',
                  backgroundColor: Color(0xff3e977a),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Configurações',
                  backgroundColor: Color(0xff3e977a),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                  backgroundColor: Color(0xff3e977a),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
