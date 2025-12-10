@echo off
chcp 65001 >nul
echo ========================================
echo Windows Post-Install Script (.bat)
echo Generated: 12/09/2025, 20:33
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

:: Communication
echo Installing Communication...
echo   - Discord
winget install --id Discord.Discord -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Zoom
winget install --id Zoom.Zoom -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - WhatsApp
winget install --id WhatsApp.WhatsApp -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Web Browsers
echo Installing Web Browsers...
echo   - Mozilla Firefox
winget install --id Mozilla.Firefox -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Media Players
echo Installing Media Players...
echo   - VLC Media Player
winget install --id VideoLAN.VLC -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - YouTube Music
winget install --id th-ch.YouTubeMusic -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Spotify
winget install --id Spotify.Spotify -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Productivity
echo Installing Productivity...
echo   - Adobe Acrobat Reader
winget install --id Adobe.Acrobat.Reader.64-bit -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Obsidian
winget install --id Obsidian.Obsidian -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Development Tools
echo Installing Development Tools...
echo   - Git
winget install --id Git.Git -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - GitHub Desktop
winget install --id GitHub.GitHubDesktop -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Notepad++
winget install --id Notepad++.Notepad++ -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Media Creation
echo Installing Media Creation...
echo   - OBS Studio
winget install --id OBSProject.OBSStudio -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - GIMP
winget install --id GIMP.GIMP -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - HandBrake
winget install --id HandBrake.HandBrake -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Audacity
winget install --id Audacity.Audacity -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
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
echo   - RetroArch
winget install --id Libretro.RetroArch -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Ubisoft Connect
winget install --id Ubisoft.Connect -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: Security & Privacy
echo Installing Security & Privacy...
echo   - Malwarebytes
winget install --id Malwarebytes.Malwarebytes -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
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

:: System Utilities
echo Installing System Utilities...
echo   - 7-Zip
winget install --id 7zip.7zip -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - PowerISO
winget install --id PowerSoftware.PowerISO -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - Everything
winget install --id voidtools.Everything -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo   - PowerToys
winget install --id Microsoft.PowerToys -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
echo.

:: No system configurations selected
echo No system configurations selected.
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
