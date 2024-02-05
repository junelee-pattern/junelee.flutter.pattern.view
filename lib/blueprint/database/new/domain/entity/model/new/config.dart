import 'dart:math';

class NewModelConfig {
  static NewModelConfig to = NewModelConfig();

  String generateDocId() {
    // return _generateRandomString();
    return "Sample";
  }
}

String _generateRandomString(int length) {
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rand = Random();

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => characters.codeUnitAt(rand.nextInt(characters.length)),
    ),
  );
}
