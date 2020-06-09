@echo off
setlocal enabledelayedexpansion

rem 启动类名
set "MAIN_CLASS=App"
for /f "tokens=1" %%a in ('jps ^| findstr %MAIN_CLASS%') do taskkill /f /pid %%a
