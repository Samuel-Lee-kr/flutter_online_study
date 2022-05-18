void main() {
  int a = 8; // 세로
  int b = 12; // 가로
  int sumSquare = a * b; // 가로 곱하기 세로
  double re2 = a.toDouble() / b.toDouble();
  int re3 = 0;
  double ty = 0.0;

  for (int aa = 1; aa < b + 1; aa++) {
    final y = (aa * re2); // y좌표
    int re4 = y.ceil() - ty.floor(); // 현재값의 올림 정수 곱하기 이전값의 내림 정수
    re3 += re4; // 1씩 올려주면서 더하면 됨.
    ty = y; // 전 좌표 저장
  }
  print(re3);
  print(sumSquare - re3);
}
