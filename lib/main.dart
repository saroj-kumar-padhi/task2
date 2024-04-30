import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/firebase_options.dart';

import 'package:hello/views/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white, // Set primary color to white
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.white, // Set app bar background color to white
        ),
        scaffoldBackgroundColor:
            Colors.white, // Set scaffold background color to white
        // Set accent color to black
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Login(),
    );
  }
}
