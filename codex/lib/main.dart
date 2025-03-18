import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CryptogramApp());
}

class CryptogramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptogram Game',
      theme: ThemeData.dark(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
