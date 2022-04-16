void main(List<String> args) {
  for(int i = 0; i < 10; i++) {
    print(i);
  }

  List numbers = [1, 1, 2, 3, 5, 8];

  int total = 0;
  for(int i = 0; i < numbers.length; i++) {
    print(numbers[i]);
  }

  for(int number in numbers) {
    total += number;
  }

  print(total);

  while(total < 100){
    total++;
  }

  print(total);
  do {
    total--;
  } while(total > 50);

  print(total);

}