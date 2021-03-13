---
title: "[Windows] pagefile.sys, hiberfil.sys"
excerpt: 
categories:
  - Windows
tags:
  - Windows
---
집에서 사용하는 랩탑의 드라이브 용량을 TreeSize를 통해 확인해보니 C 드라이브가 100 GB 정도 밖에 남아있지 않았다. 어느 부분이 용량을 많이 차지하는가 확인해보니 `C:\`에 `pagefile.sys`가 17 GB, `hiberfil.sys`가 6.3 GB 정도 차지하고 있었다.
![pagefiles-sys-hiberfil-sys-treesize-png](/assets/images/2021-03-13-Windows-pagefiles.sys-hiberfil.sys-사용-안함-설정-및-삭제/pagefiles_sys_hiberfil_sys_treesize.png){: .align-center}

해당 파일들이 뭐하는 파일인지 검색해봤다.

hiberfil.sys

- This file is something that Windows uses to help your PC wake from hibernation.
- [https://www.techadvisor.co.uk/how-to/windows/what-is-hiberfilsys-can-i-delete-it-3681469/](https://www.techadvisor.co.uk/how-to/windows/what-is-hiberfilsys-can-i-delete-it-3681469/)

pagefile.sys

- Windows uses pagefile.sys for storing the data that would otherwise be in the computer's random access memory (RAM). Sometimes there simply isn't enough capacity to hold all the necessary files in RAM, so pagefile.sys sits on your hard drive or SSD (C:\pagefile.sys) ready to receive data as necessary, and typically the least-used files in RAM are 'paged' out to this file.
- It also has another role: storing the information about the computer's state in case there's a crash or a power cut.
- [https://www.techadvisor.co.uk/how-to/windows/what-is-pagefilesys-3608749/](https://www.techadvisor.co.uk/how-to/windows/what-is-pagefilesys-3608749/)

hiberfil.sys는 Windows에서 PC를 최대 절전 모드에서 해제할 때 사용하는 파일이라고 한다. pagefile.sys는 RAM 용량이 모자라는 경우 HDD나 SDD를 RAM처럼 사용하기 위한 일종의 swap 파일 역할을 수행하고 crash가 발생하거나 전원이 끊기는 경우 컴퓨터의 상태에 관한 정보를 저장하는 역할도 수행한다고 한다.

# 1. `pagefile.sys` 사용 해제

고급 시스템 설정 > 시스템 속성 > 고급 > 성능 > 설정
![pagefile-sys-advanced-system-settings-01-png](/assets/images/2021-03-13-Windows-pagefiles.sys-hiberfil.sys-사용-안함-설정-및-삭제/pagefile_sys_advanced_system_settings_01.png){: .align-center}

성능 옵션 > 고급 > 가상 메모리 > 변경
![pagefile-sys-advanced-system-settings-02-png](/assets/images/2021-03-13-Windows-pagefiles.sys-hiberfil.sys-사용-안함-설정-및-삭제/pagefile_sys_advanced_system_settings_02.png){: .align-center}

![pagefile-sys-advanced-system-settings-03-png](/assets/images/2021-03-13-Windows-pagefiles.sys-hiberfil.sys-사용-안함-설정-및-삭제/pagefile_sys_advanced_system_settings_03.png){: .align-center}

"모든 드라이브에 대한 페이징 파일 크기 자동 관리" 옵션 해제, "페이징 파일 없음" 선택
![pagefile-sys-advanced-system-settings-04-png](/assets/images/2021-03-13-Windows-pagefiles.sys-hiberfil.sys-사용-안함-설정-및-삭제/pagefile_sys_advanced_system_settings_04.png){: .align-center}

# 2. `hiberfil.sys` 사용 해제

CMD나 PowerShell을 관리자 권한으로 실행한 후 다음의 cmdlet을 입력한다.

```pwsh
PS C:\> powercfg -h off
```

![hiberfil-sys-powershell-pnb](/assets/images/2021-03-13-Windows-pagefiles.sys-hiberfil.sys-사용-안함-설정-및-삭제/hiberfil_sys_powershell.png){: .align-center}