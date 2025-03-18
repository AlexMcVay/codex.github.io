import 'package:flutter/material.dart';
import '../services/cryptogram_generator.dart';
import '../widgets/cryptogram_display.dart';
import '../widgets/letter_input.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Map<String, String> cryptogram;
  Map<String, String> userGuesses = {};
  bool isSolved = false;

  @override
  void initState() {
    super.initState();
    cryptogram = CryptogramGenerator.generate();
  }

  void handleLetterTap(String encodedLetter) {
    if (isSolved) return; // Prevent input after solving
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LetterInput(
          onLetterSelect: (String guessedLetter) {
            setState(() {
              userGuesses[encodedLetter] = guessedLetter;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void checkSolution() {
    String decodedGuess = cryptogram["encoded"]!
        .split('')
        .map((c) => userGuesses[c] ?? '_')
        .join('');

    if (decodedGuess == cryptogram["phrase"]) {
      setState(() {
        isSolved = true;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You solved the cryptogram! 🎉"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to home
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Incorrect! Keep trying."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Decode the Cryptogram')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CryptogramDisplay(
              encodedText: cryptogram["encoded"]!,
              userGuesses: userGuesses,
              onLetterTap: handleLetterTap,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isSolved ? null : checkSolution,
              child: Text(isSolved ? 'Solved!' : 'Check Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
