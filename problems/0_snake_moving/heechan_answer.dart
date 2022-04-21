void main() {
  int cc = 20; // 세로 값
  int dd = 17; // 가로 값

  int pos = 0; // 현재 뱀의 위치
  bool isAhead = true; // true면 앞으로 감, false면 뒤로감
  for (int i = 1; i < cc + 1; i++) {
    if (i % 2 == 1) {
      // 뱀이 직진 중
      final items = List.generate(dd, (index) => '#');
      print(items.toString());
      if (isAhead)
        pos = dd - 1; // 앞으로 간 뱀이 끝까지 갔다는 포지션
      else
        pos = 0; // 뒤로 간 뱀이 끝까지 가면 위치할 포지션
      isAhead = !isAhead; // 뱀이 방향을 틀었음
    } else {
      // 뱀이 아래로 내려가는 중
      final items = List.generate(dd, (index) => '.');
      items[pos] = '#';
      print(items.toString());
    }
  }
}
