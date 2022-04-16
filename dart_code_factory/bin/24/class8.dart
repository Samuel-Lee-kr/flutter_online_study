void main(List<String> args) {
  // 캐스케이드 오퍼레이터
  Test test = Test(name: 'name', group: 'group')..sayName()..sayGroup();
}

class Test {

  String name;
  String group;

  Test({required this.name, required this.group});

  void sayName() {
    print('제 이름은 $name 입니다');
  }
  void sayGroup() {
    print('제 이름은 $group 입니다');
  }
}