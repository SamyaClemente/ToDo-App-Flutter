// import 'package:flutter/material.dart';
// import '../login.dart';

// class TelaConfig extends StatelessWidget {
//   const TelaConfig({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Align(child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
//           return const Center(
//             child: Card(
//               child: SizedBox(
//                 width: 300,
//                 height: 100,
//                 child: Center(child: Text('cvon')),
//               ),
//             ),
//           );
//         })),
//          bottomNavigationBar: Container(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//             child: BottomNavigationBar(
//               backgroundColor: const Color(0xff3e977a),
//               selectedItemColor: Colors.white,
//               unselectedItemColor: Colors.white,
//               currentIndex: _selectedIndex,
//               onTap: (int index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });

//                 if (index == 0) {
//                   // Navegar para a página Home
//                 } else if (index == 1) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const TelaLogin()),
//                   );
//                 } else if (index == 2) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const TelaConfig()),
//                   );
//                 } else if (index == 3) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const TelaLogin()),
//                   );
//                 }
//               },
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                   backgroundColor: Color(0xff3e977a),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.fact_check),
//                   label: 'Objetivos',
//                   backgroundColor: Color(0xff3e977a),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Configurações',
//                   backgroundColor: Color(0xff3e977a),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Perfil',
//                   backgroundColor: Color(0xff3e977a),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
