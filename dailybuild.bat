cd /d %~dp0
echo Build Start! %date% %time%
set yyyymmday=%date:~3,4%-%date:~8,2%-%date:~11,2%
set GIT_CLONE_ROOT_PATH=git_clone
set BUILD_OUT_ROOT_PATH=build_out
set LOG_ROOT_PATH=log
set BRANCH=master

set SOURCE_PATH=%GIT_CLONE_ROOT_PATH%\%BRANCH%\src
set OUT_PATH=%BUILD_OUT_ROOT_PATH%\%BRANCH%\out
set LOG_PATH=%LOG_ROOT_PATH%\%BRANCH%\log
set DAILY_OUT_PATH=%OUT_PATH%\%yyyymmday%
set DAILY_LOG_PATH=%LOG_PATH%\%yyyymmday%
mkdir %GIT_CLONE_ROOT_PATH%
mkdir %BUILD_OUT_ROOT_PATH%
mkdir %LOG_ROOT_PATH%
mkdir %GIT_CLONE_ROOT_PATH%\%BRANCH%
mkdir %BUILD_OUT_ROOT_PATH%\%BRANCH%
mkdir %LOG_ROOT_PATH%\%BRANCH%
mkdir %SOURCE_PATH%
mkdir %OUT_PATH%
mkdir %LOG_PATH%
mkdir %DAILY_OUT_PATH%
mkdir %DAILY_LOG_PATH%

echo Build all modules

rem clone sourcecode by jiangke
echo clone kutility %date% %time%
set gitname=kutility
git clone --branch %BRANCH% --single-branch --progress --depth 1 "https://github.com/jiangkeredgirl/"%gitname%.git %SOURCE_PATH%\%gitname% > %DAILY_LOG_PATH%\%gitname%.git.log 2>&1

rem echo clone thirdparty %date% %time%
rem set gitname=thirdparty
rem git clone --branch %BRANCH% --single-branch --progress --depth 1 "https://github.com/jiangkeredgirl/"%gitname%.git %SOURCE_PATH%\%gitname% > %DAILY_LOG_PATH%\%gitname%.git.log 2>&1

echo clone klog %date% %time%
set gitname=klog
git clone --branch %BRANCH% --single-branch --progress --depth 1 "https://github.com/jiangkeredgirl/"%gitname%.git %SOURCE_PATH%\%gitname% > %DAILY_LOG_PATH%\%gitname%.git.log 2>&1

echo Build klog start %date% %time%
call %SOURCE_PATH%\klog\build.bat %~dp0%DAILY_OUT_PATH%\klog\ >> %DAILY_LOG_PATH%\klog.build.log 2>&1
echo Build klog end! %date% %time%

pause