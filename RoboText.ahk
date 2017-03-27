; RoboText - My collection of AutohotKey scripts and hotkeys
; Author: Jamleck
; Date 	: 26/03/2017

; Configuration
;--------------
SetBatchLines -1
ListLines Off
#NoEnv
#SingleInstance force
#WinActivateForce
#Persistent
SendMode Input				; Superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.
Process,Priority,,High

; Variables
;---------------------------------
CONFIGFILE = %A_ScriptDir%\RoboText.ini
IMPORTS_DIR=%A_ScriptDir%\Imports
NOTES_DIR=C:\Projects\Notes
EMAIL=email1@example.com
EMAIL2=emai2@example.com

if NOT FileExist(CONFIGFILE)
{
	IniWrite, %EMAIL%, %CONFIGFILE%,RoboText, EMAIL
	IniWrite, %EMAIL2%, %CONFIGFILE%,RoboText, EMAIL2
} else
{
	IniRead, EMAIL, %CONFIGFILE%,RoboText, EMAIL
	IniRead, EMAIL2, %CONFIGFILE%,RoboText, EMAIL2
}

IfNotExist, %NOTES_DIR%
	FileCreateDir, %NOTES_DIR%

; Start up functions.
CreateToDoList()
	
; Set up timers
;--------------
SetTimer, OneSecondTimer, 1000

; Set up menu
;---------------------------------
Menu, Tray, Tip, RoboText
Menu, Tray, add
Menu, Tray, add, Notes, QuickNotesMenuHandler

; Import AutohotKey scripts
;---------------------------------

; Spelling Autocorrect
SetWorkingDir %IMPORTS_DIR%
	Run %IMPORTS_DIR%\AutoCorrect.ahk

OnExit, ExitSub

OneSecondTimer:
	SetTimer, OneSecondTimer, Off ;the timer turns itself off here.
return

TenMinutesTimer:
	CreateToDoListForWeek()
return

ExitSub:
	if A_ExitReason not in Logoff,Shutdown  ; Avoid spaces around the comma in this line.
	{
		SetTitleMatchMode 2
		;Terminate all open scripts
		DetectHiddenWindows On  ; Allows a script's hidden main window to be detected.
		SetTitleMatchMode 2  ; Avoids the need to specify the full path of the file below.
		WinClose  AutoCorrect.ahk
	}
	ExitApp
return

QuickNotesMenuHandler:
	filename=%NOTES_DIR%\ConfigNotes.txt
	
	if not FileExist(filename)
	{
		FileAppend,ConfigNotes, %filename%
	}
	run %filename%
return

; Include AutohotKey scripts
#include includes\AutoExpandStrings.ahk ; various short string & hot keys
#include includes\AutoHotkeyFunctions.ahk ; various functions 