@echo off

:: Add classic RMB context menu to Windows 11
:: reg add HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /f /ve

:: Show file extensions
:: reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0x0 /f

:: Downloads python
:: TO-DO: Check if Python package already exists
set python-package=https://www.python.org/ftp/python/3.10.4/python-3.10.4.exe
set download_python=bitsadmin.exe /transfer "Download Python" /download /priority FOREGROUND %python-package% C:\Users\Trendkiller\Development\bat\python.exe

@echo Downloading python package...
%download_python%
@echo Python package downloaded.

:: Check admin rights and install Python package
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    @echo Installing Python package...
    python.exe /quiet InstallAllUsers=1 TargetDir=C:\python
    @echo Python package installed.        
) ELSE (
    ECHO Run the script with Administrator priveleges!
)

:: TO-DO:
:: start python env
:: dowbload and install latest software