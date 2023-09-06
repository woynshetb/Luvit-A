import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luvit/feature/base/presentation/view/base_page.dart';
import 'package:luvit/feature/home/presentation/view/home_page.dart';
import 'firebase_options.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

bool shouldUseFirestoreEmulator = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0E0D0D),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff0E0D0D),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BasePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
