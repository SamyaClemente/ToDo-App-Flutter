import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/paginas/TelaAddCard.dart';
import 'package:flutter_application_1/widgets/paginas/Tela_config.dart';
//import 'package:flutter_application_1/widgets/paginas/login.dart';
import 'package:flutter_application_1/widgets/paginas/TelacalendarioObjetivos.dart';
import 'package:flutter_application_1/widgets/paginas/tela_user.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
    // TelaConfig(), //3 page
    TelaUser(), //4 page
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
            child: CurvedNavigationBar(
              backgroundColor: const Color(0xff3e977a),
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              height: 60,
              index: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                Icon(
                  Icons.home,
                  color: Color(0xFF3E977A),
                ),
                Icon(
                  Icons.add_task_outlined,
                  color: Color(0xFF3E977A),
                ),
                Icon(
                  Icons.person,
                  color: Color(0xFF3E977A),
                ),
                // Icon(Icons.home),
                // Icon(Icons.fact_check),
                // Icon(Icons.person),
              ],
            ),
          ),
        ),

        // bottomNavigationBar: Container(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        //     child: BottomNavigationBar(
        //       backgroundColor: const Color(0xff3e977a),
        //       selectedItemColor: Colors.white,
        //       unselectedItemColor: Colors.white,
        //       currentIndex: _selectedIndex,
        //       onTap: (int index) {
        //         setState(() {
        //           _selectedIndex = index;
        //         });
        //       },
        //       items: const [
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.home),
        //           label: 'Home',
        //           backgroundColor: Color(0xff3e977a),
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.fact_check),
        //           label: 'Objetivos',
        //           backgroundColor: Color(0xff3e977a),
        //         ),
        //         // BottomNavigationBarItem(
        //         //   icon: Icon(Icons.settings),
        //         //   label: 'Configurações',
        //         //   backgroundColor: Color(0xff3e977a),
        //         // ),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.person),
        //           label: 'Perfil',
        //           backgroundColor: Color(0xff3e977a),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
