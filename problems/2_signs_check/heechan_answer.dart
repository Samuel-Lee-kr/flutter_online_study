void main() {
  List<int> aa = [1, 2, 3];
  List<bool> bb = [false, false, true];

  int result = 0;
  var cc = aa.asMap();

  cc.forEach((key, value) {
    if (bb[key])
      result += value;
    else
      result -= value;
  });

  print(result);
}
