import 'dart:io';

void main(List<String> args) {
  String? inputStr = stdin.readLineSync();
  int input = int.parse(inputStr!);
  int factorial = 1;
  int result = 0;

  for (int i = input; i > 1; i--) {
    factorial *= i;
  }

  while (true) {
    int quotient = factorial ~/ 10;
    int remainder = factorial % 10;

    result += remainder;
    // print("fac $factorial, quo $quotient , re $remainder, res $result");
    if (quotient == 0) {
      if (result < 10) {
        break;
      } else {
        factorial = result;
        result = 0;
        continue;
      }
    }
    factorial = quotient;
  }
  
  print(result);
}
