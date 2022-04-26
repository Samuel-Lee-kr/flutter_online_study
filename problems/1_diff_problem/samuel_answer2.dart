import 'dart:io';
void main(List<String> args) {
  BigInt input = BigInt.from(int.parse(stdin.readLineSync()!));
  BigInt factorial = BigInt.one;
  BigInt ten = BigInt.from(10);
  BigInt result = BigInt.zero;

  for(BigInt i = input; i >= BigInt.one; i = i - BigInt.one){
    factorial = factorial * i;
  }

  while (true) {
    BigInt quotient = factorial ~/ ten;
    BigInt remainder = factorial % ten;

    result = result + remainder;
    // print("fac $factorial, quo $quotient , re $remainder, res $result");
    if (quotient == BigInt.zero) {
      if (result < ten) {
        break;
      } else {
        factorial = result;
        result = BigInt.zero;
        continue;
      }
    }
    factorial = quotient;
  }

  print(result.toString());

}