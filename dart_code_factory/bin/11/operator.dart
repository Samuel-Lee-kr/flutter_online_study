void main(List<String> args) {
  double number = 2;

  // 기본 연산
  print('number + 2 = ${number + 2}');
  print('number - 2 = ${number - 2}');
  print('number / 2 = ${number / 2}');
  print('number * 2 = ${number * 2}');
  print('number % 2 = ${number % 2}');

  print('number += 2 = ${number += 2}');
  print('number -= 2 = ${number -= 2}');
  print('number /= 2 = ${number /= 2}');
  print('number *= 2 = ${number *= 2}');
  print('number %= 2 = ${number %= 2}');

  // 증감연산자
  number++;
  number--;

  // 업데이트 되면서 널이 가능하려면 타입에 ?가 있어야 함
  int? number3;
  print(number3);
  number3 ??= 4;
  print(number3);

  // 비교 연산자
  int num1 = 1;
  int num2 = 2;
  print(num1 < num2);
  print(num1 > num2);
  print(num1 <= num2);
  print(num1 >= num2);
  print(num1 == num2);
  print(num1 != num2);

  // 타입 비교 연산
  print(num1 is int);
  print(num1 is String);
  print(num1 is bool);

  // and or 연산
  bool result = 12 > 10 && 1 > 0;
  print(result);
  result = 12 > 10 || 1 < 0;
  print(result);
}