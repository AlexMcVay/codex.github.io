import 'package:flutter/material.dart';
import '../services/cryptogram_generator.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Map<String, String> cryptogram;

  @override
  void initState() {
    super.initState();
    cryptogram = CryptogramGenerator.generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Decode the Cryptogram')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              cryptogram["encoded"]!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Here we would add user input fields to guess letters
          ],
        ),
      ),
    );
  }
}
