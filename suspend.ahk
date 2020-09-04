/*
 *********************************************************************************
 * 
 * suspend.ahk
 * 
 * use UTF-8 BOM
 * 
 * Version -> appVersion
 * 
 * Copyright (c) 2020 jvr.de. All rights reserved.
 *
 *********************************************************************************
*/

/*
 *********************************************************************************
 * 
 * MIT License
 * 
 * 
 * Copyright (c) 2020 jvr.de. All rights reserved.
 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all 
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * UTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
  *********************************************************************************
*/

; *********************************** settings *******************************
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force


; *********************************** prepare *******************************
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; *********************************** constants *******************************
appName := "Sleep"
appVersion := "0.015"
app := appName . " " . appVersion


if (A_IsAdmin){
	;needs installed psshutdown.exe
	
	showHint("Goto sleep, admin-mode!", 2000)
	exeToRun := A_ScriptDir . "\" . "psshutdown.exe"
	exeToRunArgs := "-d"

	Runwait, %A_ComSpec% /c %exeToRun% %exeToRunArgs%
} else {
	; unsafe method
	showHint("Goto sleep, possible unsave user-mode!", 3000)
	Runwait, rundll32.exe powrprof.dll`, SetSuspendState 
}


exitApp






