import 'dart:core';

void main() {
  int inputNumber = 4;
  String numberSum = "";
  var firstNumber = BigInt.from(1);
  var calcNumber = BigInt.from(0);

  // 팩토리얼 값 구하기-루핑돌면서 곱해라
  for (int i = 1; i <= inputNumber; i = i + 1) {
    firstNumber = firstNumber * BigInt.parse(i.toString());
  }

  // 1자리수 나올때까지 루핑
  do {
    if (firstNumber < BigInt.from(10)) {
      print(firstNumber);
      break;
    } else {
      calcNumber = BigInt.from(0);
      numberSum = firstNumber.toString();
      for (int i = 0; i < numberSum.length; i = i + 1) {
        calcNumber = calcNumber + BigInt.parse(numberSum[i]);
      }

      firstNumber = calcNumber;

      if (firstNumber < BigInt.from(10)) {
        print(firstNumber);
        break;
      }
    }
  } while (firstNumber > BigInt.from(9));
}
