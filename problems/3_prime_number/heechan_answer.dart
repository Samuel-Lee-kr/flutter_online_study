void main() {
  List<int> aa = [1, 2, 3, 4, 5];

  final bb = makeCase(aa);
  print(bb);
  // 결과값
  // {[1, 2, 3, 6]: false, [1, 2, 4, 7]: true, [1, 2, 5, 8]: false, [1, 3, 4, 8]: false, [1, 3, 5, 9]: false, [1, 4, 5, 10]: false, [2, 3, 4, 9]: false, [2, 3, 5, 10]: false, [2, 4, 5, 11]: true, [3, 4, 5, 12]: false}
}

bool isPrime(int a) {
  if (a == 2 || a == 3 || a == 5 || a == 7) return true;
  if (a % 2 != 0) {
    if (a % 3 != 0) {
      if (a % 5 != 0) {
        if (a % 7 != 0) {
          return true;
        }
      }
    }
  }
  return false;
}

Map<List<int>, bool> makeCase(List a) {
  Map<List<int>, bool> cc = {};
  for (int i = 0; i < a.length; i++) {
    for (int j = i + 1; j < a.length; j++) {
      for (int z = j + 1; z < a.length; z++) {
        bool ii = isPrime(a[i] + a[j] + a[z]);
        List<int> dd = [a[i], a[j], a[z], a[i] + a[j] + a[z]];
        final ee = {dd: ii};
        cc.addAll(ee);
      }
    }
  }
  return cc;
}
