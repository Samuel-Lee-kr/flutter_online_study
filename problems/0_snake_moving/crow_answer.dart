void main() {
  int intRow = 9; // 행
  int intColumn = 9; // 열
  int k = 0; // 뱀이 지나간 횟수 => 홀수이면 마지막 인덱스만 #, 짝수이면 그냥 마침표(.)
  String outputData = "";

  // 다중 리스트 초기화 => 구글 보고 따라함. 이해는 안됨
  List<List<String>> groupList = List.generate(intRow, (value) => []);

  for (int i = 0; i < intRow; i = i + 1) {
    if (i % 2 != 0) {
      k = k + 1;
    }
    for (int j = 0; j < intColumn; j = j + 1) {
      if (i % 2 == 0) {
        groupList[i].add("#");
      } else {
        if (k % 2 == 0) {
          if (j == 0) {
            groupList[i].add("#");
          } else {
            groupList[i].add(".");
          }
        } else {
          if (j == intColumn - 1) {
            groupList[i].add("#");
          } else {
            groupList[i].add(".");
          }
        }
      }
    }

    // 리스트를 스트링으로 붙인다.
    // 단순 toString같은 경우 대괄호 또는 콤마까지 문자로 변경
    outputData = groupList[i].join();

    print(outputData);
  }
}
