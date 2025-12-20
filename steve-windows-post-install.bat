@echo off
chcp 65001 >nul
echo ========================================
echo Windows Post-Install Script (.bat)
echo Generated: 12/20/2025, 09:44
echo ========================================
echo.

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script requires Administrator privileges.
    echo Please right-click and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo Starting installation process...
echo.
::============================================
:: SOFTWARE INSTALLATION
::============================================
echo.
echo Installing selected software...
echo This may take a while depending on your internet connection.
echo.

:: System Utilities
echo Installing System Utilities...
echo   - 7-Zip
winget install --id 7zip.7zip -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Everything
winget install --id voidtools.Everything -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - PowerToys
winget install --id Microsoft.PowerToys -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Rainmeter
winget install --id Rainmeter.Rainmeter -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - CPU-Z
winget install --id CPUID.CPU-Z -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - PowerISO
winget install --id PowerSoftware.PowerISO -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Cloud Storage
echo Installing Cloud Storage...
echo   - Dropbox
winget install --id Dropbox.Dropbox -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Google Drive
winget install --id Google.GoogleDrive -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - iCloud for Windows
winget install --id Apple.iCloud -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Security & Privacy
echo Installing Security & Privacy...
echo   - Bitwarden
winget install --id Bitwarden.Bitwarden -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Malwarebytes
winget install --id Malwarebytes.Malwarebytes -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Gaming
echo Installing Gaming...
echo   - Battle.net
winget install --id Blizzard.BattleNet -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - EA App
winget install --id ElectronicArts.EADesktop -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Epic Games Launcher
winget install --id EpicGames.EpicGamesLauncher -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - GOG Galaxy
winget install --id GOG.Galaxy -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Steam
winget install --id Valve.Steam -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Media Creation
echo Installing Media Creation...
echo   - GIMP
winget install --id GIMP.GIMP -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - HandBrake
winget install --id HandBrake.HandBrake -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - OBS Studio
winget install --id OBSProject.OBSStudio -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Inkscape
winget install --id Inkscape.Inkscape -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Development Tools
echo Installing Development Tools...
echo   - Git
winget install --id Git.Git -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Python 3.12
winget install --id Python.Python.3.12 -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Notepad++
winget install --id Notepad++.Notepad++ -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Productivity
echo Installing Productivity...
echo   - Adobe Acrobat Reader
winget install --id Adobe.Acrobat.Reader.64-bit -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Media Players
echo Installing Media Players...
echo   - VLC Media Player
winget install --id VideoLAN.VLC -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Spotify
winget install --id Spotify.Spotify -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Communication
echo Installing Communication...
echo   - Discord
winget install --id Discord.Discord -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Zoom
winget install --id Zoom.Zoom -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

::============================================
:: SYSTEM CONFIGURATIONS
::============================================
echo.
echo Applying system configurations...
echo.

:: Disable background apps
echo Applying: Disable background apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
echo.

:: Disable Superfetch/SysMain
echo Applying: Disable Superfetch/SysMain
sc config SysMain start= disabled
sc stop SysMain
echo.

:: Disable Windows Tips
echo Applying: Disable Windows Tips
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f
echo.

:: Disable Fax service
echo Applying: Disable Fax service
sc config Fax start= disabled
sc stop Fax
echo.

:: Remove Bing News
echo Applying: Remove Bing News
powershell -Command "Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage"
echo.

:: Remove Bing Weather
echo Applying: Remove Bing Weather
powershell -Command "Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage"
echo.

:: Remove casual games
echo Applying: Remove casual games
powershell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BubbleWitch* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage king.com* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage"
echo.

:: Remove Get Help app
echo Applying: Remove Get Help app
powershell -Command "Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage"
echo.

:: Remove Mixed Reality Portal
echo Applying: Remove Mixed Reality Portal
powershell -Command "Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *HolographicFirstRun* | Remove-AppxPackage"
echo.

:: Remove Windows Maps
echo Applying: Remove Windows Maps
powershell -Command "Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage"
echo.

:: Disable Bing search in Start Menu
echo Applying: Disable Bing search in Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
echo.

:: Disable advertising ID
echo Applying: Disable advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
echo.

:: Disable app suggestions
echo Applying: Disable app suggestions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
echo.

:: Disable location tracking
echo Applying: Disable location tracking
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f
echo.

:: Disable tailored experiences
echo Applying: Disable tailored experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
echo.

:: Set CPU to maximum performance
echo Applying: Set CPU to maximum performance
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setactive SCHEME_CURRENT
echo.

:: Ultimate Performance power plan
echo Applying: Ultimate Performance power plan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /S e9a42b02-d5df-448d-aa00-03f14749eb61
echo.

::============================================
:: INSTALLATION COMPLETE
::============================================
echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.
echo If any installations failed, check errors.log
echo.
echo Next steps:
echo   1. Restart your computer if required
echo   2. Log into your installed applications
echo   3. Customize your settings as needed
echo.
echo Generated by Windows Post-Install Generator
echo https://github.com/kaic/win-post-install
echo.
pause
