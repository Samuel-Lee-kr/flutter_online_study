void main() {
  A a = A();
  a.gggg(10);
  print(a.result);
}

class A {
  int result = 1;
  void gggg(int a) {
    result = result * a;
    if (a != 1) {
      gggg(a - 1);
    }
  }
}
