@echo off
title "Win10 taskkill - all not responding"
REM close all not responding processes. intended for win10.ahk

C:\Windows\System32\tasklist.exe /fi "STATUS eq NOT RESPONDING"
echo.
C:\Windows\System32\taskkill.exe /f /fi "STATUS eq NOT RESPONDING"
echo.
Pause