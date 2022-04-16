void main(List<String> args) {
  Test test = Test('samuel', 'private samuel');
  test.sayName();
}

class Test {

  String name;
  // private value
  String _privateName;

  Test(this.name, this._privateName);

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