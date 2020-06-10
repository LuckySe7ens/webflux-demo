@echo off

rem set "JAVA_HOME=xxxx"
if not "%JAVA_HOME%" == "" goto goOk
echo The JAVA_HOME variable is not defined correctly
goto end
:goOk
set "MAIN_CLASS=com.leospring.App"
echo Using CURRENT_DIR:     "%cd%"
cd ..
set "DEPLOY_DIR=%cd%"
set "LOG_DIR=%DEPLOY_DIR%"
echo Using LOG_DIR: "%LOG_DIR%"


if exist "%JAVA_HOME%\bin\java.exe" goto okHome
echo Can not find java.exe in JAVA_HOME variable
goto end
:okHome
set "JAVA_CMD=%JAVA_HOME%\bin\java.exe"

set "CLASSPATH=%DEPLOY_DIR%\conf\;%DEPLOY_DIR%\lib\*;."
set "JAVA_OPTS= -server -Dfile.encoding=UTF-8 -XX:+UseG1GC -Xms256m -Xmx256m -XX:MetaspaceSize=80M -XX:MaxMetaspaceSize=80M -Xss512K -verbose:gc -Xloggc:%LOG_DIR%\gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps"

"%JAVA_CMD%" %JAVA_OPTS% -Dbasedir=%DEPLOY_DIR% -classpath "%CLASSPATH%" %MAIN_CLASS% &

:end