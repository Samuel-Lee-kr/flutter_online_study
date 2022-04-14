import 'dart:ffi';

void main(List<String> args) {

  List list1 = [];
  print(list1);

  // 없어짐
  // List list2 = new List();

  list1.add('sam');
  list1.add('samuel');
  list1.add('samuel lee');
  
  print('-------------');
  print(list1);

  list1.removeAt(1);
  print(list1);

  print(list1[0]);
  print(list1[1]);

  list1[0] = '사무엘';
  print(list1[0]);

  // 제너릭
  List<String> list2 = [];
  list2.add('sam');
  // list2.add(123); // error

  // 리스트 길이 제한 기존 코드 막힘
  // List<String> limitList = new List(3);
  List<String> limitList = List.filled(3, '');
  // 에러 
  // limitList.add('tttt');

  print(limitList);
  
  List<String> initList = [
    't1',
    't2',
    't3',
    't4',
    't5',
    't6'
  ];

  print(initList);
  
}