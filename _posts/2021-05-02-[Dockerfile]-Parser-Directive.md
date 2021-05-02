---
title: "[Dockerfile] Parser directive"
excerpt: 
categories:
  - Docker
tags:
  - Docker
  - Dockerfile
---
- Dockerfile 내 구문들이 처리되는 방법을 지시하는 구문을 의미한다.
- `# directive = value` 형식의 특수한 주석 형태로 기재한다.
- Build 단계로 표시되지 않고, build에 layer를 추가하지도 않는다.
- Parser directive가 한번 처리되고 나면 docker는 추가적인 parser directive를 찾지 않는다. Parser directive 이 후 주석, 빈 줄, builder 명령이 처리되고 나면 Parser directive가 나타나더라도 단순한 주석으로 처리된다. 따라서 Parser directive는 Dockerfile 맨 위에 위치해야 한다.
- Case-insensitive 성질을 갖지만 convention은 소문자 기재이다.
- Parser directive 위에 빈 줄을 포함하는 것 또한 Convention이다. 따라서 line continuation character는 지원되지 않는다.
- 현재 지원되는 Parser directive는 2 가지이다.
  1. `syntax`
  2. `escape`

# Syntax

```Docker
# syntax=[remote image reference]
```

사용 예:
```Docker
# syntax=docker/dockerfile:1
# syntax=docker.io/docker/dockerfile:1
# syntax=example.com/user/repo:tag@sha256:abcdef...
```

Syntax directive는 BuildKit 이라는 builder backend를 사용하는 경우에만 쓸 수 있고 Dockerfile을 build하는데 사용되는 Dockerfile syntax의 위치를 정의한다.

Docker에서 Dockerfile을 build하는 default syntax말고 custom dockerfile implementations로 build하기 위해서 사용한다.

# Escape
```Docker
# escape=\ (backslash)
```

or
```Docker
# escape=` (backtick)
```

Escape directive는 Dockerfile 내에서 사용되는 escape 문자를 지정할 때 사용한다. escape directive가 없는 경우 default value는 `\` (backslash)이다. 해당 기능은 주로 Windows OS에서 build하는 경우 사용하게 된다. Unix-based OS (MacOS, Linux 등)에서는 escape 문자로 `\` (backslash)를 사용하고 directory path separator로 `/` (slash)를 사용하지만, Windows OS는 escape 문자로 `` ` ``(backtick)을 사용하고 directory path separator로 `\` (backslash)를 사용한다.

Dockerfile에서 default escape character는 `\` (backslash)이므로 Windows의 directory path separator를 표기하기 위해서는 Windows PowerShell처럼 `\\`을 사용해야 한다. 이는 사용에 불편함을 주고 예기치 않는 build 실패를 유발할 수 있다. 따라서 Escape directive로 escape 문자를 `` ` `` (backtick)으로 지정해버리면 문제를 간단하게 해결할 수 있다.