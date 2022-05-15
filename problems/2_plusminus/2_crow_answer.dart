void main() {
  List<bool> signs = [true, false, false, true, false];
  List<int> absolutes = [1, 6, 3, 5, 7];

  // 빈 맵을 한번 만들어봄 ...
  Map<int, bool> dataMap = {};

  // 굳이 맵을 만들필요는 없지만 key:value 쌍으로 명확하게 변환
  for (int i = 0; i < signs.length; i = i + 1) {
    // 루핑 돌명서 map 데이터 추가
    // true 양수 false 음수
    dataMap.addAll(
        {signs[i] == true ? absolutes[i] : absolutes[i] * -1: signs[i]});
  }

  // map의 keys 부분이 구하는 숫자의 값이므로 누적해서 더함
  int resultSum = dataMap.keys.fold(0, (prev, next) => prev + next);

  // map의 데이터
  print(dataMap);
  // 결과값
  print(resultSum);
}
