void main(List<String> args) {
  // 중첩된 수가 없으며
  // 최대 숫자가 1000이기 때문에
  // 1000 + 999 + 998 = 2997
  // 계산 편의성을 위해 0 인덱스에 대한 부분도 고려하여 2998 크기를 생성
  List<bool> primeList = List.filled(2998, true);
  List<int> input = [1, 2, 3, 4];
  List<int> input2 = [1, 2, 7, 6, 4];
  int result = 0;

  // 0 과 1은 소수가 아님 반복문 처리의 용이성을 위해 미리 처리
  primeList[0] = primeList[1] = false;

  // x * x > arrayLength 일 경우(최대 약수)
  // 남은 숫자는 모두 소수
  for (int i = 2; i * i < primeList.length; i++) {
    if (primeList[i]) {
      for (int j = i * i; j < primeList.length; j += i) {
        primeList[j] = false;
      }
    }
  }

  for (int i = 0; i < input.length - 2; i++) {
    for (int j = i + 1; j < input.length - 1; j++) {
      for (int k = j + 1; k < input.length; k++) {
        int current = input[i] + input[j] + input[k];
        if (primeList[current]) {
          result++;
        }
      }
    }
  }
  
  print(result);
  result = 0;

  for (int i = 0; i < input2.length - 2; i++) {
    for (int j = i + 1; j < input2.length - 1; j++) {
      for (int k = j + 1; k < input2.length; k++) {
        int current = input2[i] + input2[j] + input2[k];
        if (primeList[current]) {
          result++;
        }
      }
    }
  }

  print(result);

}
