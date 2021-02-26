---
title: "[Git] Commit message template"
excerpt: "Git의 Commit message template을 생성해 적용해보았다."
categories:
  - Git
tags:
  - Git
---

# 1. Git config에 template 추가

```bash
git config --global commit.template ~/.gitmessage
```
명령을 실행하면 `.gitconfig`파일에 다음과 같이 설정된다.

```bash
[commit]
    template = ~/.gitmessage
```
<br>

# 2. Commit message template 작성

Template file로 등록한 `~/.gitmessage` 파일을 작성한다.

```bash
# <type>: <subject>
##### Subject 50 characters ################# -> |


# Body Message
######## Body 72 characters ####################################### -> |

# Issue Tracker Number or URL

# --- COMMIT END ---
# Type can be
#   feat    : new feature
#   fix     : bug fix
#   refactor: refactoring production code
#   style   : formatting, missing semi colons, etc; no code change
#   docs    : changes to documentation
#   test    : adding or refactoring tests
#             no productin code change
#   chore   : updating grunt tasks etc
#             no production code change
# ------------------
# Remember me ~
#   Capitalize the subject line
#     제목줄은 대문자로 시작한다.
#   Use the imperative mood in the subject line
#     제목줄은 명령어로 작성한다.
#   Do not end the subject line with a period
#     제목줄은 마침표로 끝내지 않는다.
#   Separate subject from body with a blank line
#     본문과 제목에는 빈줄을 넣어서 구분한다.
#   Use the body to explain what and why vs. how
#     본문에는 "어떻게" 보다는 "왜"와 "무엇을" 설명한다.
#   Can use multiple lines with "-" for bullet points in body
#     본문에 목록을 나타낼때는 "-"로 시작한다.
# ------------------
```
<br>

# 3. Test

Windows 환경에서 Git commit 하는 경우 아래처럼 Commit message가 template으로 출력된다.

![git-commit-template-test1](/assets/images/2021-02-26-Git-Commit-message-template/commit-test-CRLF.png){: .align-center}


그림에서 보면 ^M 이라는 글자가 매 줄마다 붙어있는 것을 확인할 수 있다. 이는 Windows와 Unix/Linux의 차이에서 비롯된 부분이다. Windows의 경우 line ending에 CR(Carriage-Return, \r)과 LF(Line Feed, \n)을 사용하고 UNIX/Linux/Mac은 LF("\n")만 사용한다. Git은 리누스 토발즈가 개발한 프로그램이므로 당연히 Linux base이다. 따라서 Windows에서 엔터로 줄바꿈을 하면 Git에서는 Windows의 CR-LF 입력 중 LF만 가지고 개행 처리하고 CR은 글자로 남겨둔다. 이로 인해서 ^M 글자가 남게 되는 것이다.

이 글자를 삭제하기 위해서는 git editor가 vim 인 경우 `:%s/\r$`를 입력해주면 된다. 하지만 매번 입력해주면 귀찮으므로 나의 경우 WSL에서 `~/.gitmessage` 파일을 다시 생성하기로 했다.

![git-commit-template-test-정상](/assets/images/2021-02-26-Git-Commit-message-template/commit-test-정상.png){: .align-center}

위의 그림처럼 정상적으로 출력되는 것을 확인할 수 있다.

Reference
- [https://ujuc.github.io/2020/02/02/git-commit-message-template-man-deul-gi/](https://ujuc.github.io/2020/02/02/git-commit-message-template-man-deul-gi/)
- [https://stackoverflow.com/questions/1110678/m-at-the-end-of-every-line-in-vim](https://stackoverflow.com/questions/1110678/m-at-the-end-of-every-line-in-vim)