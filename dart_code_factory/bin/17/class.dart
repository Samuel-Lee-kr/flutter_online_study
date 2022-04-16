void main(List<String> args) {
  Test test = Test(name: 'samuel');
  Test test2 = Test.fromMap({'name': 'samuellee'});
  test.sayName();
  test2.sayName();
}

class Test {
  String name = 'samuel lee';

  // 코딩 포맷
  // https://dart-lang.github.io/linter/lints/prefer_initializing_formals.html
  Test({required this.name});

  Test.fromMap(Map input) {
    name = input['name'];
  }

  void sayName() {
    print('제 이름은 $name입니다.');
  }
}