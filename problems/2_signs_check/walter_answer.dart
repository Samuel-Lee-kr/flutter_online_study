void main() {
  List<int> absolutes = [4, 7, 12];
  List signs = [true, false, true];

  int answer = 0;

  for (int i = 0; i < signs.length; i++) {
    signs[i] == true ? answer += absolutes[i] : answer -= absolutes[i];
  }

  print(answer);
}
