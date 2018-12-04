@echo off
set ARGS=%*
if "%ARGS%"=="" (
    %~dp0\gradlew.bat -q run
) else (
    %~dp0\gradlew.bat -q run --args="%ARGS%"
)
