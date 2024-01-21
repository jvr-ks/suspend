@rem compile.bat

echo off

cd %~dp0

SET appname=hibernate

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon %appname%.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%32.exe /icon %appname%.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 32-bit.bin"


SET appname=suspend

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon %appname%.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%32.exe /icon %appname%.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 32-bit.bin"


