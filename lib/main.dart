import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
MaterialColor myPrimaryColor = MaterialColor(
  0xFF176C8C,
  <int, Color>{
    50: Color(0xFF176C8C),
    100: Color(0xFF176C8C),
    200: Color(0xFF176C8C),
    300: Color(0xFF176C8C),
    400: Color(0xFF176C8C),
    500: Color(0xFF176C8C),
    600: Color(0xFF176C8C),
    700: Color(0xFF176C8C),
    800: Color(0xFF176C8C),
    900: Color(0xFF176C8C),
  },
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Gulshanedurood',
      theme: ThemeData(
        primarySwatch: myPrimaryColor,
      ),
      home: Splashscreen(),
    );
  }
}
