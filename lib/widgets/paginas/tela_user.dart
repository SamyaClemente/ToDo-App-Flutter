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
      backgroundColor: const Color(0xFF3E977A),
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('Perfil do Usuário'),
        titleTextStyle: const TextStyle(
          color: Color(0xff1e6951),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Color.fromARGB(255, 241, 253, 245),
        // actions: [

        // ],
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
                    radius: 80,
                    backgroundImage: _imageURL != null
                        ? FileImage(File(_imageURL!))
                        : FirebaseAuth.instance.currentUser?.photoURL != null
                            ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)
                            : Image.asset('assets/default_profile_image.png').image,
                    backgroundColor: Color.fromARGB(255, 241, 253, 245),
                  ),
                  FloatingActionButton(
                    onPressed: _pickImage,
                    child: const Icon(Icons.edit),
                    backgroundColor: Color(0xff1e6951),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Bem-vindo ${FirebaseAuth.instance.currentUser?.displayName ?? ''}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 241, 253, 245)),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${FirebaseAuth.instance.currentUser?.email ?? ''}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 241, 253, 245)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1e6951),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  shadowColor: Colors.black,
                  elevation: 9,
                ),
                child: const Text(
                  'LogOut',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
                  } catch (e) {
                    print('Erro ao fazer logout: $e');
                  }
                },
              ),
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     textStyle: const TextStyle(fontSize: 15),
            //   ),
            //   onPressed: () async {
            //     try {
            //       await FirebaseAuth.instance.signOut();
            //       Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
            //     } catch (e) {
            //       print('Erro ao fazer logout: $e');
            //     }
            //   },
            //   child: const Text(
            //     'LogOut',
            //     style: TextStyle(
            //       color: Color(0xff1e6951),
            //     ),
            //   ),
            // ),
            // IconButton(
            //   onPressed: () async {
            //     try {
            //       await FirebaseAuth.instance.signOut();
            //       Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
            //     } catch (e) {
            //       print('Erro ao fazer logout: $e');
            //     }
            //   },
            //   icon: const Icon(Icons.logout),
            //   color: const Color(0xff1e6951),
            // ),
          ],
        ),
      ),
    );
  }
}
