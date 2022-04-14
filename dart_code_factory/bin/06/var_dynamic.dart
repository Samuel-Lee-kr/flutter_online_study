void main(List<String> args) {
  var name = 'samuel lee';
  print(name);

  name = 'samuel';
  print(name);

  // var 타입은 첫 선언 시의 타입을 유지
  // name = 1; // error

  dynamic name2 = 'samu';
  print(name2);

  name2 = 2;
  print(name2);

  // var 타입 값을 넣지 않고 선언만 할 시 dynamic 타입처럼 실행이 됨(에러가 아님)
  var name3;

  name3 = 'sam';
  print(name3);

  name3 = 1;
  print(name3);

}