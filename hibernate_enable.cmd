@rem hibernate_enable.cmd
@rem run as admin

@net session >nul 2>&1
@if NOT %ERRORLEVEL% == 0 goto noadmin

@powercfg.exe /hibernate on
@goto finished

:noadmin
@echo ERROR, Script must be run as an Administrator, exiting!
@echo.
@goto finished

:finished
@pause
