import 'dart:io';

void main(List<String> args) {
  
  List<String>? input = stdin.readLineSync()?.split(" ");
  
    int row = int.parse(input![0]);
    int column = int.parse(input![1]);
    String fullLine = "#" * row;
    String rightLine = "." * (row - 1) + "#";
    String leftLine = "#" + "." * (row - 1);

    for(int i = 0; i < column; i++) {
      switch (i % 4) {
        case 0:
        case 2:
          print(fullLine);  
          break;
        case 1:
          print(rightLine);
          break;
        case 3:
          print(leftLine);
          break;
      }
    }
    
}