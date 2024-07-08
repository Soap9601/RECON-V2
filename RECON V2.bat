@echo off
title RECONV2

:menu
cls
echo RECONV2
echo.
echo 1. Convert Hostname to IP Address
echo 2. Get the Device/Domain Name from IP Address
echo 3. List your Public and Private IP Address
echo 4. Exit
echo.
set /p choice=Select an option (1-4): 

if %choice%==1 goto host2ip
if %choice%==2 goto getdomain
if %choice%==3 goto listip
if %choice%==4 goto exit

:host2ip
set /p hostname=Enter the hostname to convert to IP address: 
nslookup %hostname%
pause
goto menu

:getdomain
set /p ip=Enter the IP address to get the domain name: 
nslookup %ip%
pause
goto menu

:listip
echo Your Public IP Address:
curl ifconfig.me
echo.
echo Your Private IP Address:
ipconfig | findstr /i "IPv4"
pause
goto menu

:exit
exit
