@echo off
set id=%USERNAME%

for /f "tokens=1,2,* " %%i in ('REG QUERY HKEY_CURRENT_USER\Software\Rime\Weasel /v RimeUserDir ^| find /i "RimeUserDir"') do set "UserDir=%%k"

if defined UserDir (
    echo "变量 UserDir 的值不为空"
) else set UserDir="C:\Users\%id%\AppData\Roaming\Rime"

REG ADD "HKEY_CURRENT_USER\Software\Rime\Weasel" /v RimeUserDir /t REG_SZ /d %UserDir% /f

set tables="%~dp0"
cd %tables%

if "%time:~0,1%"==" " set "time=0%time:~1%"

color 0a
for /f "tokens=*" %%a in ('time/t') do set now=%%a
set ymd=%date:~0,4%%date:~5,2%%date:~8,2%
set hms=%now:~0,2%%now:~3%%time:~6,2%
set new=%ymd%%hms%

rem echo 清除数据目录的临时内容
rem DEL /Q "%UserDir%\installation.yaml"
rem DEL /Q "%UserDir%\user.yaml"
rem RD /S /Q "%UserDir%\build"

md %HOMEPATH%\Desktop\小狼毫98五笔个人档备份
md %HOMEPATH%\Desktop\小狼毫98五笔个人档备份\%new%


echo d|xcopy "%UserDir%" "%HOMEPATH%\Desktop\小狼毫98五笔个人档备份\%new%" /S /R /E
