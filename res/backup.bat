@echo off
set id=%USERNAME%

for /f "tokens=1,2,* " %%i in ('REG QUERY HKEY_CURRENT_USER\Software\Rime\Weasel /v RimeUserDir ^| find /i "RimeUserDir"') do set "UserDir=%%k"

if defined UserDir (
    echo "���� UserDir ��ֵ��Ϊ��"
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

rem echo �������Ŀ¼����ʱ����
rem DEL /Q "%UserDir%\installation.yaml"
rem DEL /Q "%UserDir%\user.yaml"
rem RD /S /Q "%UserDir%\build"

md %HOMEPATH%\Desktop\С�Ǻ�98��ʸ��˵�����
md %HOMEPATH%\Desktop\С�Ǻ�98��ʸ��˵�����\%new%


echo d|xcopy "%UserDir%" "%HOMEPATH%\Desktop\С�Ǻ�98��ʸ��˵�����\%new%" /S /R /E
