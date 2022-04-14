void main(List<String> args) {

  Map dictionary = {
    'apple': '사과',
    'banana': '바나나',
    'watermelon': '수박',
  };

  print(dictionary);
  print(dictionary['apple']);
  print(dictionary['banana']);
  print(dictionary['watermelon']);
  
  Map dictionary2 = {};

  dictionary2.addAll({
    'apple': '사과',
    'banana': '바나나',
    'watermelon': '수박',
  });
  print(dictionary2);

  dictionary2.remove('apple');
  print(dictionary2);

  dictionary2['banana'] = '버내너';
  print(dictionary2);

  // 선언 방식
  Map dictionary3 = {};
  Map dictionary4 = new Map();
  Map dictionary5 = new Map.from({});

  print(dictionary3);
  print(dictionary4);
  print(dictionary5);

  // 키, 벨류 값 가져오기
  print(dictionary2.keys.toList());
  print(dictionary2.values.toList());

  // 제너릭
  Map<String, int> price = {
    'apple': 2000,
    'banana': 4000,
    'watermelon': 6000
  };

  print(price);
 
}