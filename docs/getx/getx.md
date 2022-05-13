# GetX

## 1 GetX 개요
[GetX 링크](https://pub.dev/packages/get)
고성능의 상태관리와 종속성 관리, 경로 관리 등을 쉽게 사용할 수 있음

### 1.1 기본 원칙
#### PERFORMANCE(성능)
최소한의 리소스 사용 및 성능에 포커싱
#### PRODUCTIVITY(생산성)
쉬운 구문, 개발시간 단축, 메모리 최적화 (유지하고 싶을 경우 permanent: true 를 명시적으로 사용해야 함)
#### ORGANIZATION(체계성)
View, Logic, DI 등 분리 작업이 가능하여 클린코드 작성이 가능

## 2 설치 및 import, 기본 세팅

#### 설치
```
flutter pub add get
```

#### import
```dart
import 'package:get/get.dart';
```

#### main 문
기존의 MaterialApp을 **GetMaterialApp** 으로 수정
```dart
void main() => runApp(GetMaterialApp(home: Home()));
```

## 3 컨트롤러와 stl에서 사용하는 방법

#### Getx Controller 생성
```dart
class Controller extends GetxController {
    var count = 0.obs;
    increment() => count++;
}
```

#### stl 에서의 활용

```dart
class Home extends StatelessWidget {

    @override
    Widget build(context) {
        final Controller c  = Get.put(Controller());

        return Scaffold(
            appBar: AppBar(
                title: Obx(() => Text('clicks: ${c.count}'))
            ),
            body: Center(
                child: ElevatedButton(
                    child: Text('Go to Other'),
                    onPressed: () {
                        Get.to(Other());
                    }
                ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                    c.increment();
                }
            ),
        );
    }
}

class Other extends StatelessWidget {
    final Controller c = Get.find();

    @override
    Widget build(context) {
        return Scaffold(
            body: Center(
                child: Text(
                    '${c.count}'
                ),
            ),
        );
    }
}
```

## 4 상태 관리

#### Simple state Manager( GetBuilder )

```dart
var name = 'samuel lee'
```

#### reactive state Manager (GetX/Obx) - 값이 바뀌었을 때 관련된 모든 위젯이 자동으로 변경

```dart
var name = 'samuel lee'.obs;
```

UI 에서  해당 값을 표시하고 값이 변경될 때마다 화면을 업데이트
```dart
Obx(() => Text('${controller.name}'))
```


## 5 경로 관리
GetX 는 Context를 사용하지 않고 페이지 전환을 할 수 있어 편리
```dart
// 새로운 페이지
Get.to(NextScreen());

// 새로운 페이지(네임드)
Get.to('/next');

// Navigator.pop(context) 와 같이 이전으로 돌아가거나 dialog 와 같은 것을 close 할 때
Get.back();

// 다음 페이지로 이동하고, 본인 페이지를 없애는 경우(스플래쉬 화면 같은 것)
Get.off(NextScreen());

// 다음 페이지로 이동하고 모든 기존 라우트를 없애는 경우
Get.offAll(NextScreen());
```

## 6 종속성 관리
동일한 클래스를 검색, 사용하기 편함(Spring 의 Singleton 패턴을 활용한 Bean 사용방법과 컨셉이 비슷)  
Get 인스턴스 내에서 인스턴스를 만드는 것이기 때문에 앱 전체에서 사용 가능

```dart
Controller controller = Get.put(Controller());

// 스프링의 @Autowired 와 비슷하게 알아서 찾아서 DI 해줌
Controller controller = Get.find();
```


## heechan 링크 파일
https://whispering-touch-c35.notion.site/GetX-24e326ed4bfd411595ad37026d6f5217