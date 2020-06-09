@echo off

set "MAIN_CLASS=com.leospring.App"
echo Using CURRENT_DIR:     "%cd%"
cd ..
set "DEPLOY_DIR=%cd%"
set "LOG_DIR=%DEPLOY_DIR%"
echo Using LOG_DIR: "%LOG_DIR%"

set "JAVA_CMD=%JAVA_HOME%\bin\java.exe"
echo deploy_dir:"%DEPLOY_DIR%"

set CLASSPATH="%DEPLOY_DIR%\conf\;%DEPLOY_DIR%\lib\*;."
set "JAVA_OPTS= -server -Dfile.encoding=utf-8 -XX:+UseG1GC -Xms256m -Xmx256m -XX:MetaspaceSize=80M -XX:MaxMetaspaceSize=80M -Xss512K -verbose:gc -Xloggc:%LOG_DIR%\gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps"

"%JAVA_CMD%" %JAVA_OPTS% -Dbasedir=%DEPLOY_DIR% -classpath %CLASSPATH% %MAIN_CLASS% &