@echo off

echo.

echo.
echo Starting compatibility optimizer installation...
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading slightly less cool files...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/floofydude68/R_G-s-roblox-optimizer/main/ClientAppSettings-less-optimized-ver-but-more-compatibility', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo Less cool files downloaded successfully
    echo.
    echo SUCCESS: installation completed good job
) else (
    echo Failed to download optimizer.
    echo.
    echo ERROR: installation failed wtf did you do??? WHAT HAVE YOU DONE!!!!!
)

echo.
echo THIS IS THE COMPATIBILITY OPTIMIZER
echo.
echo If you need help, DM r_g on discord
echo.
echo Press any key to continue... & pause >nul
