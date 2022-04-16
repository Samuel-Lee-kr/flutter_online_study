void main(List<String> args) {
  
  int number = 21;
  if(number % 4 == 0) {
    print('4의 배수');
  } else if (number % 4 == 1) {
    print('나머지가 1');
  } else if (number % 4 == 2) {
    print('나머지가 2');
  } else {
    print('조건에 안맞음');
  }
  
  switch(number % 4) {
    case 0 :
      print('4의 배수');
      break;
    case 1 :
      print('나머지 1');
      break;
    case 2 :
      print('나머지 2');
      break;
    case 3 :
      print('나머지 3');
      break;
    default:
      print('어떤 조건도 맞지 않음');
      break;
  }

}