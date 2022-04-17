# Git flow 기본 활용법

#### 목차
0 [깃 플로우 정보 공유](#0-깃-플로우-정보-공유)  
1 [깃 플로우 설정](#1-깃-플로우-설정)  
2 [깃 플로우 활용](#2-깃-플로우-활용)  
&nbsp;&nbsp;2.1 [기본 내용 정리](#21-기본-내용-정리)  
&nbsp;&nbsp;2.2 [Feature 브랜치 사용법](#22-feature-브랜치-사용법)  
&nbsp;&nbsp;&nbsp;&nbsp;2.2.1 [브랜치 생성](#221-브랜치-생성)  
&nbsp;&nbsp;&nbsp;&nbsp;2.2.1 [브랜치 종료(Local to Remote)](#222-브랜치-종료local-to-remote)  




### 0 깃 플로우 정보 공유
[우아한 형제들 정리 포스트](https://techblog.woowahan.com/2553/)  

### 1 깃 플로우 설정
깃 프로젝트로 설정되어 있는 repo에서 해당 명령어 실행  
정상적으로 세팅이 되었을 경우 develop 브랜치가 추가되고, 현재 브랜치가 develop 브랜치로 설정

```
// git repo를 git flow를 활용할 수 있도록 설정
// -d 키워드를 활용하지 않을 경우 브랜치 명을 설정해주어야 함
git flow init -d


git branch

* develop
  main
```

### 2 깃 플로우 활용

#### 2.1 기본 내용 정리
기본적으로 활용할 수 있는 브랜치 명은 많으나 (release, hotfix, support, feature 등)  
스터디 기준 feature 브랜치만 활용하였으면 함  

기본 룰은 각 상황에 따라 다르지만 룰 공지  

**\=\=\=\= 기본 룰 공지 \=\=\=\=**
- feature 브랜치는 local에서만 활용할 것(remote 로 업로드 하지 않을 것)
- feature 브랜치는 큰 범위로 지정하는 것이 아닌, 최소한의 작은 작업으로 잡을 것
  - 예시: BAD  - Make marketing APP
  - 예시: GOOD - add login func
- feature 브랜치 내에서 커밋을 디테일하게 작성하여, 커밋 메시지를 통해 업데이트를 유추, 확인할 수 있도록 권장
- 최소 2개의 Commit 을 해야 함(그래프 상 파악이 용이)

#### 2.2 Feature 브랜치 사용법

##### 2.2.1 브랜치 생성
develop 브랜치에서 아래의 키워드를 활용하여 브랜치 생성  
feature 명은 **날짜_브랜치** 형식으로 작성하면 좋음

```
// feature 브랜치 생성
git flow feature start 2022_04_17_add_docs

// 브랜치 확인
git branch

  develop
* feature/2022_04_17_add_docs
  main
```

#### 2.2.2 브랜치 종료(Local to Remote)
기본 룰 공지에서도 언급했듯이 feature 브랜치는 local에서만 반영할 것  
더 이상 브랜치가 필요 없을 때 (브랜치의 목적 달성 시)  
develop에 merge하는 방법을 기술

```
// feature 브랜치 develop 에 merge 후 feature 브랜치 자동 삭제
git flow feature finish 2022_04_17_add_docs


git branch

* develop
  main

// develop 브랜치 Local to Remote update
// conflict 가 날 수 있으나 git의 단순 활용보다 훨씬 적은 conflict
git push
```

브랜치의 목적 달성 이전 브랜치가 더 이상 필요 없을 시  
일반 브랜치 제거하듯 제거해주면 됌

```
// 제거하고자 하는 브랜치가 아닌 다른 브랜치에서 해당 명령어 사용
git branch -d 브랜치명
```