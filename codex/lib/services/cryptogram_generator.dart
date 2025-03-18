import 'dart:math';

class CryptogramGenerator {
  static final List<String> phrases = [
    "Flutter is awesome",
    "Keep coding daily",
    "Cryptograms are fun",
  ];

  static Map<String, String> generate() {
    final random = Random();
    String phrase = phrases[random.nextInt(phrases.length)].toUpperCase();
    Map<String, String> cipher = {};

    List<String> alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('');
    List<String> shuffled = List.of(alphabet)..shuffle();

    for (int i = 0; i < alphabet.length; i++) {
      cipher[alphabet[i]] = shuffled[i];
    }

    return {
      "phrase": phrase,
      "encoded": phrase.split('').map((c) => cipher[c] ?? c).join(),
    };
  }
}
