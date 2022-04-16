void main(List<String> args) {
  Map map = {
    'apple': '사과',
    'banana': '바나나',
    'kiwi': '키위'
  };

  print(map.keys);
  print(map.values);

  print(map.keys.toList());
  print(map.values.toList());

  final newMap = map.entries.map((entry) {
    final key = entry.key;
    final value = entry.value;

    return '$key 는 한글로 $value 입니다.';
  });

  print(newMap);

  List<int> numbers = [1, 2, 3, 4, 5];

  print(numbers.asMap());

}