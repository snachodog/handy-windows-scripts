net stop wuauserv
cd "%Windir%\SoftwareDistribution"
del /f /s /q Download
net start wuauserv
timeout /t 30
