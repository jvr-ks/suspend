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
appName := "Suspend"
appVersion := "0.031"
app := appName . " " . appVersion

font := "Calibra"
fontsize := "10"
hibernate := false

Loop % A_Args.Length()
{
  if(eq(A_Args[A_index],"hibernate")){
    hibernate := true
  }
  
  if(eq(A_Args[A_index],"h")){
    hibernate := true
  }
  
  if(eq(A_Args[A_index],"-h")){
    hibernate := true
  }
}

if (A_IsAdmin){
  ;needs installed psshutdown.exe
  exeToRun := "psshutdown.exe"
  exeToRunArgs := "-d -t 3"
  if (hibernate)
    exeToRunArgs := "-h -t 3"
    
  try {
    Run,%exeToRun% %exeToRunArgs%,,UseErrorLevel
    if (hibernate)
      showHint("""Hibernate""-mode!", 2000)
    else
      showHint("""Suspend""-mode!", 2000)
    
    sleep, 2000
  } catch e {
    msgbox, ERROR starting %exeToRun%!
  }
} else {
  ; unsafe method
  showHint("""Suspend""-mode , possible unsave user-mode!", 3000)
  sleep, 3000
  
  if (hibernate)
    ; Parameter #1: Pass 1 instead of 0 to hibernate rather than suspend.
    ; Parameter #2: Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
    ; Parameter #3: Pass 1 instead of 0 to disable all wake events.
    DllCall("PowrProf\SetSuspendState", "Int", 1, "Int", 1, "Int", 1)
  else
    DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 1, "Int", 1)
}

exitApp


;------------------------------------ eq ------------------------------------
eq(a, b) {
  if (InStr(a, b) && InStr(b, a))
    return 1
  return 0
}
;--------------------------------- showHint ---------------------------------
showHint(s, n){
  global font
  global fontsize
  
  Gui, hint:Destroy
  Gui, hint:Font, %fontsize%, %font%
  Gui, hint:Add, Text,, %s%
  Gui, hint:-Caption
  Gui, hint:+ToolWindow
  Gui, hint:+AlwaysOnTop
  Gui, hint:Show
  t := -1 * n
  setTimer,showHintDestroy, %t%
  return
}

;------------------------------ showHintDestroy ------------------------------
showHintDestroy(){
  global hinttimer

  setTimer,showHintDestroy, delete
  Gui, hint:Destroy
  return
}







