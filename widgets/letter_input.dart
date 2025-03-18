import 'package:flutter/material.dart';

class LetterInput extends StatelessWidget {
  final Function(String) onLetterSelect;

  LetterInput({required this.onLetterSelect});

  @override
  Widget build(BuildContext context) {
    List<String> alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('');

    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: alphabet.map((letter) {
        return ElevatedButton(
          onPressed: () => onLetterSelect(letter),
          child: Text(letter, style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            shape: CircleBorder(),
          ),
        );
      }).toList(),
    );
  }
}
