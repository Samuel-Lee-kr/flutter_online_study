void main() {
  int result = 1;
  A a = A();
  a.gggg(5);
  print(a.result); //
  int result2 = a.tttt(a.result);
  print(result2); //
}

class A {
  int result = 1;
  int fresult = 0;
  void gggg(int a) {
    result = result * a;
    if (a != 1) {
      gggg(a - 1);
    }
  }

  int tttt(int a) {
    List<String> aa = a.toString().split('');
    aa.forEach((element) {
      fresult = fresult + int.parse(element);
    });
    if (fresult > 10) {
      tttt(fresult);
    }
    return fresult;
  }
}
