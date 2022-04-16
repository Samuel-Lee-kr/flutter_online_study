void main(List<String> args) {
  
  // Looping
  // Mapping
  // Reduce/Fold

  List<String> list = ['t1', 't2', 't3', 't4'];

  // 제시된 루핑은 forEach 메소드 자체를 사용하나 avoid 가 떠서 enhanced for 문으로 변경함
  for (var element in list) {
    print(element);
  }


  // Mapping
  final newList = list.map((e) => '나는 $e');
  print(newList);

  // Reduce / Fold
  // reduce : 사용 타입과 리턴 타입이 같아야 함
  // fold : 사용 타입과 리턴 타입이 달라도 됨
  List<int> numbers = [1, 2, 3, 4, 5];
  int total = numbers.fold(0, (total, e) {
    return total + e;
  });

  print(total);

  int total2 = numbers.reduce((total, element) => total + element);

  print(total2);

}