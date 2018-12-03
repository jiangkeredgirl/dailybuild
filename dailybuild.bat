cd /d %~dp0
echo Build Start! %date% %time%
set yyyymmday=%date:~3,4%-%date:~8,2%-%date:~11,2%
set ROOT_PATH=gitrepository
set BRANCH=master

set SOURCE_PATH=%ROOT_PATH%\%BRANCH%\src
set OUT_PATH=%ROOT_PATH%\%BRANCH%\out
set LOG_PATH=%ROOT_PATH%\%BRANCH%\log
set DAILY_OUT_PATH=%OUT_PATH%\%yyyymmday%
set DAILY_LOG_PATH=%LOG_PATH%\%yyyymmday%
mkdir %ROOT_PATH%
mkdir %ROOT_PATH%\%BRANCH%
mkdir %SOURCE_PATH%
mkdir %OUT_PATH%
mkdir %LOG_PATH%
mkdir %DAILY_OUT_PATH%
mkdir %DAILY_LOG_PATH%

echo Build all modules

rem klog by jiangke
echo clone klog %date% %time%
git clone --branch %BRANCH% --single-branch --progress --depth 1 https://github.com/jiangkeredgirl/klog.git %SOURCE_PATH%\klog > %DAILY_LOG_PATH%\klog.git.log 2>&1
echo Build klog start %date% %time%
call %SOURCE_PATH%\klog\build.bat >> %DAILY_LOG_PATH%\klog.build.log 2>&1
echo Build klog end! %date% %time%

pause