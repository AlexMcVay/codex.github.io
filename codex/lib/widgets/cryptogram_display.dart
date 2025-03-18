import 'package:flutter/material.dart';

class CryptogramDisplay extends StatelessWidget {
  final String encodedText;
  final Map<String, String> userGuesses;
  final Function(String) onLetterTap;

  CryptogramDisplay({
    required this.encodedText,
    required this.userGuesses,
    required this.onLetterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: encodedText.split('').map((char) {
        if (char == ' ') {
          return SizedBox(width: 20);
        }
        return GestureDetector(
          onTap: () => onLetterTap(char),
          child: Container(
            width: 40,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 2, color: Colors.blue)),
            ),
            child: Text(
              userGuesses[char] ?? '_',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}
