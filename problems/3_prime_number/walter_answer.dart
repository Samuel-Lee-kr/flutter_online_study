void main() {
  List list = [1, 2, 7, 6, 4];
  int result = 0;
  for (int i = 0; i < list.length; i++) {
    for (int j = i + 1; j < list.length; j++) {
      for (int k = j + 1; k < list.length; k++) {
        if (check(list[i], list[j], list[k]) == true) {
          result += 1;
        }
      }
    }
  }
  print(result);
}

check(int a, int b, int c) {
  int check = a + b + c;
  for (int i = 2; i < check; i++) {
    if (check % i == 0) {
      return false;
    }
  }
  return true;
}
