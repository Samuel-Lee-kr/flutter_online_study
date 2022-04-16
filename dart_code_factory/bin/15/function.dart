void main(List<String> args) {
  List testList = [1, 1, 2, 3, 5, 8];

  int sum = 0;

  for(int number in testList){
    sum += number;
  }

  print(sum);

  print(addList(testList));
}

int addList(List list, [int? a = 3]) {
  int total = 0;
  for (int number in list) {
    total += number;
  }

  return total;
}

int addList2({required List list, int? a}) {
  int total = 0;
  for (int number in list) {
    total += number;
  }

  return total;
}