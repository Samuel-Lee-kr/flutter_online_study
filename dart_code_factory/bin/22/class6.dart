void main(List<String> args) {
  Engineer en = Engineer(name: 'name', languages: ['dart', 'java']);
  en.sayInfo();
}

class Employee {
  static String building = 'Samuel';
  String name;

  Employee(this.name);

  void printNameAndBuilding() {
    print('제 이름은 $name 입니다. $building 건물에서 근무하고 있습니다.');
  }
}

class Engineer extends Employee {
  List<String> languages;

  Engineer({required String name, required this.languages}): super(name);

void sayInfo() {
  print('저의 이름은 $name 이고 제가 근무하는 장소는 ${Employee.building} 이고 제가 사용하는 언어는 ${languages.join(', ')}입니다.');
}
}