# 위젯 추천

## 1. 스플래시 위젯
**widgets/my_splash 프로젝트 참고**
### 1.1 flutter_native_splash
#### 설치
```
flutter pub add flutter_native_splash
```
#### pubspec.yaml 설정
```dart
// pubspec.yaml 파일에서 설정해줘야하는 것이 있음

dependencies:
  flutter_native_splash: ^2.1.6

// 해당 부분의 인덴트는 없음 == dependencies와 인덴트가 동일(pubspec 은 인덴트 중요)
// background 는 배경 이미지 설정
// image 는 메인 이미지 설정
// png 파일을 사용하면 괜찮은 스플래시 화면 설정 가능
flutter_native_splash:
  background_image: assets/splash_background.png
  image: assets/splash.png

```
#### 설정 적용
```dart
// 커멘드에서 해당 명령어 순차적으로 사용
flutter clean
flutter pub get
flutter pub run flutter_native_splash:create

// 커멘드에서 Native Splash Complete 가 뜨면 정상 적용 가능
```

#### 사용
```dart
import 'package:flutter_native_splash/flutter_native_splash.dart';

// ... 중략 ...

// 초기화가 됐을 경우, remove 를 통해 스플래시 화면을 없애주어야 함
void main() {
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: createAnimatedSplashScreen(),
    );
  }
}
```

### 1.2 animated_splash_screen (처음 찾았지만 native_splash 가 더 좋다고 판단됨)

#### 설치
```
flutter pub add animated_splash_screen
```

#### 사용

```dart
import 'package:animated_splash_screen/animated_splash_screen.dart';

// ... 중략 ...

// 메소드로 스크린 위젯 사용할 수 있도록 작성
// pageTransitionType: PageTransitionType.scale 은 docs에 있으나 사용 시 Exception 뜸
// 무난하게 사용하기는 좋으나, 이미지 관련 작업이 위에 언급된 native보다 까다로움
Widget createAnimatedSplashScreen() {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Icons.home,
        nextScreen: const MyHomePage(title: 'Flutter Demo Home Page'),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
      );
  }
```

