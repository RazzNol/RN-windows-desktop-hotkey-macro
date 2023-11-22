;	RN windows desktop hotkey macro
;	AHK version: 1.1.26.01
;		requires: win10ahk_taskkill.bat
;		run on startup - place a shortcut in Autostart directory

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
#MaxThreads 2
#MaxMem 64

;---------------------------------------------------------------------------------------------------------------------------------------------------------
;	Win10 SYSTEM
;---------------------------------------------------------------------------------------------------------------------------------------------------------

;		TASKKILL on [Ctrl]+[Alt]+[0]
;		kills all non-responding processes
;		requires win10ahk_taskkill.bat
^!Numpad0::
^!NumpadIns::
^!0::
Run win10ahk_taskkill.bat
Return

;		WINDOWS EXPLORER RESTART on [Win]+[Ctrl]+[Alt]+[0]
;		restarts GUI (explorer.exe)
#^!Numpad0::
#^!NumpadIns::
Run C:\Windows\System32\taskkill.exe /f /im explorer.exe ,,hide
Sleep 1000
Run C:\Windows\explorer.exe ,,hide
Return

;		WINDOWS EXPLORER TOGGLE on [Win]+[Ctrl]+[0]
;		toggles GUI (explorer.exe) on/off
#^Numpad0::
#^NumpadIns::
IfWinActive, ahk_exe explorer.exe
	Run C:\Windows\System32\taskkill.exe /f /im explorer.exe ,,hide
Else
	Run C:\Windows\explorer.exe ,,hide
Return

;		SCREEN LOCK on [Ctrl] + [F12]
;		
^F12::
DllCall("LockWorkStation")
Return

;		SLEEP MODE on [Win]+[F12]
;		might require turning off hibernation
#F12::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
Return

;		SHUTDOWN on [Win]+[Ctrl]+[F12]
;		
#^F12::
Shutdown, 1
Return

;---------------------------------------------------------------------------------------------------------------------------------------------------------
;	Win10 USER INTERFACE
;---------------------------------------------------------------------------------------------------------------------------------------------------------

;		CENTER MOUSE CURSOR (screen 1) on [Win]+[Middle Mouse Button]
#MButton::
DllCall("SetCursorPos", int, A_ScreenWidth / 2, int, A_ScreenHeight / 2)
Return

;		VOLUME -2 on [Win] + [[]
#[::
Send {Volume_Down}
Return

;		VOLUME +2 on [Win] + []]
#]::
Send {Volume_Up}
Return

;		MUTE SYSTEM on [Win] + [\] or [Win] + [Space]
#\::
#Space::
Send {Volume_Mute}
Return

;---------------------------------------------------------------------------------------------------------------------------------------------------------
;	Win10 SOFTWARE
;---------------------------------------------------------------------------------------------------------------------------------------------------------

;		OPEN NEW NOTEPAD DOCUMENT on [WIN]+[n]
#n::
Run notepad.exe
Return
