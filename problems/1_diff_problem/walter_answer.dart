import 'dart:core';

void main() {
  int nums = 10;
  var facnums = BigInt.from(1);

  if (nums == 0) {
    print(1);
  } else {
    for (int i = nums; i > 0; i -= 1) {
      facnums *= BigInt.parse(i.toString());
    }
    print(facnums);
    while (facnums > BigInt.from(10)) {
      print('facnums $facnums');
      var cals = BigInt.from(0);
      var calnums = facnums.toString();

      for (int i = 0; i < calnums.length; i++) {
        cals += BigInt.parse(calnums[i]);
//         print(cals);
        facnums = cals;
      }
    }
    print(facnums);
  }
}
