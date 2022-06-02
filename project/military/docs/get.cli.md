설치
```
// 버전 명시하는 이유는 상위 버전은 windows 에서는 아직 버그를 잡지 못해서, 이유사항으로 1.6.0 를 쓰라고 명기되어 있음
// 설치하게 되면 환경 변수 설정을 하라는 warning이 뜸, path가 나오기 때문에 해당 path를 환경 변수 세팅해주면 됨
dart pub global activate get_cli 1.6.0

```

플러터 업데이트
```
// 프로젝트 설정 시 플러터 버전이 낮을 경우, 프로젝트 설치가 제대로 안되는 모습을 보임
// 따라서 플러터를 먼저 업데이트 진행
flutter upgrade
```

프로젝트 세팅
```
get create project:PROJECT_NAME
```