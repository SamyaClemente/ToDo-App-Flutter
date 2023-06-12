import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/widgets/paginas/login.dart';
import 'package:image_picker/image_picker.dart';

class TelaUser extends StatefulWidget {
  const TelaUser({Key? key}) : super(key: key);

  @override
  _TelaUserState createState() => _TelaUserState();
}

class _TelaUserState extends State<TelaUser> {
  String? _imageURL; // URL da imagem selecionada

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageURL = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                // Navegar para a tela de login ou tela inicial, por exemplo
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
              } catch (e) {
                // Lidar com erros, se necessário
                print('Erro ao fazer logout: $e');
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageURL != null
                        ? FileImage(File(_imageURL!))
                        : FirebaseAuth.instance.currentUser?.photoURL != null
                            ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)
                            : Image.asset('assets/default_profile_image.png').image,
                  ),
                  FloatingActionButton(
                    onPressed: _pickImage,
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Bem-vindo${FirebaseAuth.instance.currentUser?.displayName ?? ''}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${FirebaseAuth.instance.currentUser?.email ?? ''}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
