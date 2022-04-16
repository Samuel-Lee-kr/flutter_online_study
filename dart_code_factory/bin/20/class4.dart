void main(List<String> args) {
  Child c = Child(4);

  print(c.cal());
}

class Parent {
  final int number;

  Parent(this.number);

  int cal() {
    return number * number;
  }

}

class Child extends Parent {

  Child(int number): super(number);

  @override
  int cal() {
    int result = super.cal();
    return result + result;
  }

}