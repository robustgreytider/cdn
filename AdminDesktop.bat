@ECHO OFF
CLS
TITLE ""
GOTO ADMIN_DETECTED

:ADMIN_DETECTED
    SET PATH=C:\Windows;C:\Windows\System32;
    COLOR 60
    CLS
    ECHO.
    ECHO SYSTEM user detected, configuring everything, don't press anything until script ends!
    C:
    TASKKILL /F /IM WinKill* >NUL 2>&1
    TIMEOUT 5 /NOBREAK >NUL 2>&1

    RD /s /q "%windir%\System32\GroupPolicyUsers"
    RD /s /q "%windir%\System32\GroupPolicy"
    GPUPDATE /force >NUL
    REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d explorer.exe /f
    REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Windows\system32\userinit.exe," /f
    TAKEOWN /f c:\windows\explorer.exe 
    TAKEOWN /f c:\windows\SysWOW64\explorer.exe 
    ICACLS c:\windows\explorer.exe /grant gamer:RX 
    ICACLS c:\windows\SysWOW64\explorer.exe /grant gamer:RX 
    TAKEOWN /f c:\windows\system32\openwith.exe
    TAKEOWN /f c:\windows\SysWOW64\openwith.exe 
    ICACLS c:\windows\system32\openwith.exe /grant gamer:RX 
    ICACLS c:\windows\SysWOW64\openwith.exe /grant gamer:RX 
    USERINIT
    slmgr.vbs /skms kms.lotro.cc
    TIMEOUT 5 /NOBREAK >NUL 2>&1
    slmgr.vbs /ato
    NET user Administrator /active:yes
    NET user Administrator Picteon123
    NET user gamer Picteon123
    NET localgroup Administrators /add gamer 

