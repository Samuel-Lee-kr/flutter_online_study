import 'dart:core';

void main() {
  int nums = 78754;
  var facnums = BigInt.from(1);

  if (nums == 0) {
  } else {
    for (int i = nums; i > 0; i -= 1) {
      facnums *= BigInt.parse(i.toString());
    }
    print(facnums);
    while (facnums > BigInt.from(9)) {
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
