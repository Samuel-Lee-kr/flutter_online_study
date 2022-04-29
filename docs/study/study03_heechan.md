# widget UI 관련 스터디 (3주차)

1. Column

→ children에 때려박으면 세로 한줄로 나옴

1. Row

→ children에 때려박으면 가로 한줄로 나옴

1. Expanded

→ 1, expanded(2), 3 이렇게 하면 한 줄에 2번이 겁나 늘어남

<정렬>

끝에서 부터 mainAxisAlignment: MainAxisAlignment.end,

양끝딴 정렬 mainAxisAlignment: MainAxisAlignment.spaceBetween,

1. SafeArea: 기기별로 화면의 padding. 

⇒ Scaffold의 body를 감싸주면됨.

1. spacer()

→ 공간 꽉채워줌

w1, spacer(flex:1), w2, spacer(flex:2)

=⇒ 공간을 1 : 2 비율로 만들어줌. 

1. card : 카드처럼 감쌈

Card( child:... )

1. width: double.infinity —> 최대한으로 길이를 잡는 속성
2. **위젯은 자신이 정확하게 정의한 넓이같은 속성이 없다면 기본적으로 자식이 정의한 넓이를 따라감. (법칙)**

 

![20220408_101856.jpg](../imgs/study03_0.jpg)

![Untitled](../imgs/study03_1.png)

![Untitled](../imgs/study03_2.png)

1. 텍스트

![Untitled](../imgs/study03_3.png)

1. 컨테이너 vs 로우, 컬럼

![Untitled](../imgs/study03_4.png)

1. 맥스 .. 표시

Text(
'${widget.campingSiteInfo.address}',
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: textTheme().bodyText2,
),

1. 파이어베이스 in 조건

->whereIn 키워드 쓰셈. array어쩌구리는 아님. 거지같다 파이어베이스. 그래도 무료라 

1. Text.rich()

하나의 스타일 보다 더 다양한 스타일의 문자들을 적용하여 문단을 만들 고자 할 때 쓸 수 있는 constructor 다. (TextRich 와 기능이 비슷하다.)

TextSpan 을 이용해 스타일을 적용하고자 하는 만큼의 문자, 문자열 지정할 수 있고, 여러개의 TextSpan 을 가질 수 있어 다양한 스타일이 존재하는 문단을 만들 수 있다.

출처:

[https://iosroid.tistory.com/36](https://iosroid.tistory.com/36)

[조용한 담장]

1. Textspan

특정 길이의 문자(*text*)를 한 단위로 하여 스타일(*style*)을 적용하는데 사용한다.

자식 위젯으로 TextSpan 리스트를 가질 수 있으며, 모두 한 문단으로 화면에 그려진다.

*text* 와 *children* 둘 다 값을 가지면, 자식 위젯 리스트 중 첫번째 위치의 *text* 값으로 으로 적용된다.

출처:

[https://iosroid.tistory.com/36](https://iosroid.tistory.com/36)

[조용한 담장]

```dart
const Text.rich( TextSpan( text: 'Hello', // default text style 
children: <TextSpan>[ 
	TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)), 
		TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)), 
], ), )
```

1. image fit

child: Image.network(
widget.campingsiteinfo.posUrlToImage,
fit: BoxFit.contain,

- 1번 : 원본. 가로세로 비율 변화 없음(contain)
- 2번 : 지정한 영역을 꽉 채운다. 비율 변경됨. 가장 많이 사용하는 옵션 중의 하나(fill)
- 3번 : 너비에 맞게 확대 또는 축소. 수평으로 크기 때문에 위아래 여백 발생(fitWidth)
- 4번 : 높이에 맞게 확대 또는 축소. 수평으로 크기 때문에 수평 잘리는 영역 발생(fitHeight)
- 5번 : 지정한 영역을 꽉 채운다. 비율 유지. 3번 또는 4번을 상황에 맞게 선택(cover)
- 6번 : 원본 크기 유지. 원본으로부터 해당 영역 크기만큼 가운데를 출력. 기본 옵션(none)

출처:

[https://pythonkim.tistory.com/110](https://pythonkim.tistory.com/110)

[파이쿵]

1. 글꼴 수정
- 일부만 수정시 copyWith써준다.

textTheme()
.bodyText1!
.copyWith(color: Colors.orange)

1. final List<aaa> _aaa 
    - _aaa.add(’dfdf’) : 가능하다.
    - final은 해당 변수에 대한 포인터만 불변이므로 포인터를 변경하지 않는 add등은 사용할수있다.
    - ... 은 못쓴다?
    
2. ListView
- 기본적으로 무한대의 크기를 갖는 위젯

![Untitled](../imgs/study03_5.png)

- children 방식과 builder방식이 있으며 builder방식을 쓰면 보이는것만 로드하여 메모리 관리에 좋다.
- 쓸 수 있으면 builder방식을 사용하는것을 권장함

1. 익명함수 인자 사용하고 싶지 않을때 : (_) ⇒ test, 

1. Function 멤버변수 사용하는 케이스, 요건
- 내부적으로 사용하는 값들을 외부로 전달하여 외부 클래스에서 특정 동작을 정의하고 싶을때
- 클래스간 변수 매핑 시킬때도 쓰일 수 있음
- Stateful 클래스

⇒ 선언부

- A class (StatefulWidget)
    - final Function(String a)? onApplyClick;
- B class (State, A)
    - onTap(){ widget.onClick(’하하호호');

⇒ 사용시점

- C class (StatelessWidget)
    - A class 호출 :
    
    ```dart
    A(
    	 onApplyClick: (String a){
    		setState((){
    				b = a;
    			});
    	}
    )
    ```
    
    - 예시 2
    
    ```dart
    class A {
      final Function(String) ggg;
      A({required this.ggg});
    
      void CC() {
        ggg('이것은 A 클래스의 전달 값입니다. ');
      }
    }
    
    void main() {
    
      String cccc = '하하';
      A a = A(ggg: (String a) {
        cccc = a;
      });
      a.CC();
      print(cccc);    // 결과값 : 이것은 A 클래스의 전달 값입니다. 
    }
    
    ```
    
    - 예시 3
        - 달력 팝업 화면에서 시작과 끝 날짜를 선택후 확인 눌렀을때 팝업화면을 호출한 부모 화면에 시작, 끝 날짜를 동적으로 바꾸고 싶을때
        - 만약 확인버튼이 다른 프레임에 있다면?