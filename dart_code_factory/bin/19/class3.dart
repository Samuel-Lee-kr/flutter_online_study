void main(List<String> args) {
  Test2 test = Test2('samuel', 'private samuel');
  test.sayName();
  test.sayTest2();
}

class Test {

  String name = '';
  // private value
  String _privateName = '';

  Test() {
    name = 'sam';
    _privateName = 'samuel';
  }

  Test.fromData(this.name, this._privateName);

  void sayName() {
    print(name);
    print(_privateName);
  }

  String get privateName {
    return _privateName;
  }

  set privateName(String privateName) {
    _privateName = privateName;
  }
}

class Test2 extends Test {

  Test2(String name, String _privateName) : super.fromData(name, _privateName);

  void sayTest2() {
    print('test2');
  }
}