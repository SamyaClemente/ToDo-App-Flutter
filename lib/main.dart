import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/paginas/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/widgets/botoes/task_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/services/widget_tree.dart';
import 'package:flutter_application_1/services/firebase_options.dart';
import 'package:flutter_application_1/services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Movido para cá

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(create: (context) => TaskProvider()),
        // Adicione quaisquer outros provedores que você precise
      ],
      child: const MaterialApp(
        home: const WidgetTree(),
      ),
    );
  }
}
