import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

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
              ], color: Color(0xFFE4E9E8), borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Center(
                child: Column(children: [
                  SizedBox(height: 50),
                  Text(
                    'Registro',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    SizedBox(height: 15),
                    FilledButton.tonal(
                      onPressed: null,
                      child: Text('Entrar'),
                    ),
                    Text(
                      'ou',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    FilledButton.tonal(
                      onPressed: null,
                      child: Text('Cancelar'),
                    ),
                    SizedBox(height: 30),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    SizedBox(height: 15),
                  ]),
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
