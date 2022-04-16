void main(List<String> args) {
  Employee em = Employee('name');
  em.printNameAndBuilding();

  Employee.building = 'tt';
  em.printNameAndBuilding();
}

class Employee {
  static String building = 'Samuel';
  String name;

  Employee(this.name);

  void printNameAndBuilding() {
    print('제 이름은 $name 입니다. $building 건물에서 근무하고 있습니다.');
  }
}