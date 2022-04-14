void main(List<String> args) {
  
  // 런타임 시점
  final String name = 'samuel';
  // error - 값을 바꿀 수 없음
  // name = 'sam';

  // 컴파일 시점
  const String name2 = 'samuel'; 
  // error - 값을 바꿀 수 없음
  // name2 = 'sam';

  DateTime now = DateTime.now();
  print(now);

  Future.delayed(
    Duration(milliseconds: 1000),
    () {
      DateTime now2 = DateTime.now();
      print(now2);
    },
  );

}