# Suspend

Simple App (Windows > 10 only) to put Windows into:  
"Suspend"-mode \*1) or
"Hibernate"-mode (hibernate.exe -> below)

To enable "Hibernate"-mode, run "hibernate_enable.cmd" once as an admin,  
if it is not already enabled.  
  
If you are admin Suspend uses:  
"Suspend"-mode: psshutdown.exe -d  
or  
"Hibernate"-mode: psshutdown.exe -h  
(if argument "hibernate" or (h) or (-h) is passed to suspend.exe)  
  
If you run Suspend without beeing an admin it does:   
(Via the DllCall "PowrProf\SetSuspendState"   
which is possible unsafe, in rare cases a data loss may occur,  
but I use it multible times every day. Make sure that all programs are closed or idle!)  
  
In "Hibernate"-mode:  
If hibernation is enabled, it hibernates the PC,  
if hibernation is disabled, it suspends the PC!  
  
In "Suspend"-mode:  
It suspends the PC! 
  
Hint: Make a shortcut of "suspend.exe" or a copy in the taskbar.  
Then enable "Run as an Administrator" in the properties.  
  
**suspend.exe** is 64 bit  
**suspend32.exe** is 32 bit  

Just added:  
**hibernate.exe** is 64 bit  
**hibernate32.exe** is 32 bit  
which just calls "suspend.exe -h", but has a dark green H-icon!  
  
[More on Windows suspend modes](https://superuser.com/questions/71835/what-is-the-difference-between-these-four-sleep-states)  
  
[PsShutdown homepage/download](https://docs.microsoft.com/en-us/sysinternals/downloads/psshutdown)  
  
Use \[CTRL] + click to open links in a new window.  
  
\*1) I prefer "Suspend"-mode: Windows can be waked-up by pressing the space-bar.  
In "Hibernate"-mode you must press the power-button (but "Hibernate"-mode saves more energy ...)  
Windows automatically switches the "Suspend"-mode to "Hibernate"-mode after a while.  
  
##### License: MIT
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sub license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2020 J. v. Roos


##### Virusscan at Virustotal 
[Virusscan at Virustotal, suspend.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/24af5c1a4133ded2401a39a06cc2850b425575acad9216e7bff28d48cb5e85a2/detection/u-24af5c1a4133ded2401a39a06cc2850b425575acad9216e7bff28d48cb5e85a2-1705873505
)  
[Virusscan at Virustotal, suspend2.exe 32bit-exe, Check here](https://www.virustotal.com/gui/url/48fada23cf45f0f62a6f8e47b39c0213855ecac4300eecb684fcc0e1fc1a8ddd/detection/u-48fada23cf45f0f62a6f8e47b39c0213855ecac4300eecb684fcc0e1fc1a8ddd-1705873506
)  
