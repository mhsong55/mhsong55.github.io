---
title: "vscode extension sync"
excerpt: "vscode의 extension 정보를 동기화하기"
categories:
  - Editor
tags:
  - VS Code
  - Extension
---

# 사용법을 기재해둔 블로그

- https://medium.com/@indexx/vs-code-extension-settings-sync-%EC%82%AC%EC%9A%A9%EB%B0%A9%EB%B2%95-f9b039a2bd6
- https://velog.io/@gwangsuda/Github-Gist-%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-Visual-Stduio-Code-%EC%84%A4%EC%A0%95%EC%9D%84-%EB%8F%99%EA%B8%B0%ED%99%94-%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95-70k0oup2fc

# 작업 순서

1. `Settings Sync` Extension 설치
2. Github의 gist token 생성
3. VS Code에서, `Ctrl + U` 누른 후 gist token 입력
4. Upload 완료 후 출력된 gist id 저장
5. 다른 컴퓨터의 VS Code에서 Settings Sync 설치한 후 `Ctrl + D`를 누르고 gist token과 gist id를 순차적으로 입력