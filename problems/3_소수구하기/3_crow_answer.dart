void main() {
  List<int> numbers = [1, 2, 7, 6, 4];
//   List<int> numbers = [1, 2, 3, 4];
  List<int> results = [];
  bool isTrue = true;
  int subCount = 3; // 3개씩
  Set<int> valueSet = {};

  // 그냥 정렬 한번 해봄
  numbers.sort();

  // 선규님 도와주셔서 넣긴 했는데...여전히 이해는 안감...그냥 외우자!
  for (int i = 0; i < numbers.length - (subCount - 1); i = i + 1) {
    for (int j = i + 1; j < numbers.length - (subCount - 2); j = j + 1) {
      for (int k = j + 1; k < numbers.length - (subCount - 3); k = k + 1) {
        int h = numbers[i] + numbers[j] + numbers[k];
        valueSet.add(h);
      }
    }
  }

  // 중복제거를 위해 set을 사용했고 리스트에 담았음
  results = valueSet.toList();
  print(results); // 리스트확인용

  // 소수의 정의 1이나 2가 아니고(1이나 2로 나누지 말고?), 자신의 숫자 이전까지로만 나눌때
  // 몫이 없는건가? 여튼 이정의임..
  for (int v = 0; v < results.length; v = v + 1) {
    int resultInt = int.parse(results[v].toString());
    // 1이나 2이면 땡
    if (resultInt == 1 || resultInt == 2) {
      print("h :  말도 안되는 소리");
      continue;
    } else {
      // 구글링 해서 가져옴
      for (int z = 2; z < resultInt - 1; z = z + 1) {
        isTrue = true;
        if (resultInt % (z + 1) == 0) {
          isTrue = false;
          break;
        }
      }

      if (isTrue == true) {
        print("h : " + resultInt.toString() + " 숫자는 소수입니다.");
      }
    }
  }
}
