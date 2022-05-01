import 'dart:math';

String generateNumber(int numberLength) {
  Random random = Random();
  String number = '';
  for (int i = 0; i < numberLength; i++) {
    number = number + random.nextInt(9).toString();
  }
  return number;
}
