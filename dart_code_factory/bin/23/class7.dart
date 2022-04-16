void main(List<String> args) {
  Test test = Test('test');
  test.sayName();
  Test2 test2 = Test2('test2');
  test2.sayName();
  
}

class TestInterface {
  late String name;

  void sayName(){}
}

class Test implements TestInterface {

  @override
  String name;

  Test(this.name);

  @override
  void sayName() {
    print('제 이름은 $name 입니다');
  }

}

class Test2 implements TestInterface {

  @override
  String name;

  Test2(this.name);

  @override
  void sayName() {
    print('제 이름은 $name 입니다');
  }

}