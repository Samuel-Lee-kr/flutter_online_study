void main(List<String> args) {
  
  List<int> absolute1 = [4, 7, 12];
  List<int> absolute2 = [1, 2, 3];

  List<bool> signed1 = [true, false, true];
  List<bool> signed2 = [false, false, true];

  int result = 0;

  for(int i = 0; i < absolute1.length; i++) {
    result += signed1[i] ? absolute1[i] : -absolute1[i];
  }

  print(result);
  
  result = 0;

  for(int i = 0; i < absolute2.length; i++) {
    result += signed2[i] ? absolute2[i] : -absolute2[i];
  }

  print(result);
  
}
