# 깃 활용법

#### 목차
0 [깃 다운로드](#0-깃-다운로드)  
1 [깃 다운로드 링크](#1-깃-사용법-공유)  
&nbsp;&nbsp;1.1 [깃 허브 설치 후 최초 설정](#11-깃허브-설치-후-최초-설정)  
&nbsp;&nbsp;&nbsp;&nbsp;1.1.1 [작성자 설정](#111-작성자-설정)  
&nbsp;&nbsp;&nbsp;&nbsp;1.1.2 [커밋 메시지 편집기 설정](#112-커밋-메시지-편집기-설정)  
&nbsp;&nbsp;1.2 [Local 프로젝트 repo로 만들기](#12-local-프로젝트-repo로-만들기)  
&nbsp;&nbsp;1.3 [1.3 기본 흐름 정리(세팅이 필요한 repo의 경우)](#13-기본-흐름-정리세팅이-필요한-repo의-경우)  
&nbsp;&nbsp;1.4 [기본 흐름 정리(이미 세팅이 완료된 repo의 경우)](#14-기본-흐름-정리이미-세팅이-완료된-repo의-경우)  
&nbsp;&nbsp;1.5 [개인 의견](#15-개인-의견)  
&nbsp;&nbsp;1.6 [전용 깃 프로그램 추천](#16-전용-깃-프로그램-추천)  




## 0 깃 다운로드
**[깃 다운로드 링크](https://git-scm.com/downloads)**  
자신의 os에 맞는 깃을 다운로드 받아서 설치 진행

## 1 깃 사용법 공유
**./docs/pdf/progit.pdf**에 자료를 업로드하였으니 해당 자료를 활용하여 각종 키워드에 대한 지식을 쌓아가면 좋음  
자세한 사용법은 구글링, 전용 자료를 활용하는 것이 옳으나, 간단한 부분 공유  

### 1.1 깃허브 설치 후 최초 설정

#### 1.1.1 작성자 설정
글로벌로 설정하게 되면, default 개념이라고 보면 되며  
글로벌로 지정하지 않으면 해당 프로젝트에 들어가서 글로벌 키워드를 제거하여 새로운 이름과 이메일을 지정

```
git config --global user.name "YOUR NAME"
git config --global user.email yourEmail@email.com
```

#### 1.1.2 커밋 메시지 편집기 설정
-m 키워드를 이용한 간단한 커밋 메시지를 남기는 것도 나쁘지 않으나  
디테일한 커밋 메시지를 남기기 위해 편집기를 설정하여 작성하는 것을 추천

```
git config --global core.editor "code --wait"
```

### 1.2 Local 프로젝트 repo로 만들기
작업 중인 Local 프로젝트 루트에서 해당 명령어 활용

```
git init
```

### 1.3 기본 흐름 정리(세팅이 필요한 repo의 경우)
모든 작업은 git repo로 지정된 **프로젝트 루트 경로**에서를 기준으로 함  
세팅이 필요한 repo의 경우, 초기 local 과 remote를 연결하는 방법이나 local을 remote에 반영하는 방법만 숙지하고 있으면 됨  

```
// remote 설정
// local과 remote를 연결해주는 명령어
git remote add origin 깃허브 링크 

// 초기 push 시 branch를 만들면서 혹은 연결하면서 업로드
// -u : --set-upstream 의 간략 키워드
git push -u origin main

```

### 1.4 기본 흐름 정리(이미 세팅이 완료된 repo의 경우)
위에서도 언급하였으나 기본적으로 깃 활용법은 직접 배우는 것을 추천  

**\=\=\=\= 기본흐름 \=\=\=\=**  
1. git pull
2. git add something
3. git commit   || git commit -m "commit msg"
4. git push

```
// Remote to Local update
// remote에서 version up 이 되어있을 경우, local update
git pull

----------------------------

// 개인이 수정, 추가, 삭제한 모든 변경사항에 대한 적용방법(Staging)

// 개별 파일
// 변경사항 개별 반영
// 개인적으로는 p태그를 좋아함: p태그로 좀 더 디테일한 commit을 구성 가능
git add [-p] 파일이름(경로 포함)

// 전체 파일
// 변경사항 전체 반영
// 개인적으로는 권장하지 않음
git add .

----------------------------

// 버전업 (commit)
// 편집기 설정 했을 시
git commit

// 편집기 설정 하지 않았을 시
git commit -m "commit msg"

----------------------------

// Local to Remote update
// conflict 가 날 수 있음 -> 해결방법은 여러 방법이 있으니 구글링
git push
```

```
// 추천 커밋메시지 작성 방법

[file direction] TITLE

1. add: SubTitle
 - explain

2. mod: SubTitle
 - explain

```

### 1.5 개인 의견
기본형태로 활용하게 되면, 거의 모든 커밋마다 conflict가 날 수 있음(협업의 의미가 퇴색)  
따라서 git flow를 활용하여 협업하였으면 함

### 1.6 전용 깃 프로그램 추천

#### 1.6.1 git bash
가장 기초적이자 가장 활용하기 쉬움, 고급 명령어를 제외하면 git bash에서 처리하면 간단하게 처리 가능

#### 1.6.2 vs code extentsion
개인적으로 가장 많이 활용하는 부분, 예전엔 소스트리를 활용하였으나 code에서 작성 후 바로 반영하는 매력이 큼

#### 1.6.3 소스트리
고급 명령어 등 활용하기에 따라 좋은 툴이 될 수 있으나 개인적으로는 vs로 해도 충분

#### 1.6.4 깃 크라켄
유료 툴로 개인적인 느낌은 디자인적 이득말고는 딱히 없다고 봄
