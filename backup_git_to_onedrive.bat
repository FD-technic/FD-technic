@echo off

REM Zdroj = složka, kde je tento .bat
set SOURCE=%~dp0

REM Odebere poslední zpětné lomítko
set SOURCE=%SOURCE:~0,-1%

REM Získání názvu složky
for %%I in ("%SOURCE%") do set FOLDERNAME=%%~nxI

REM Cíl (OneDrive)
set DEST=C:\Users\Petr\OneDrive\backup\%FOLDERNAME%

REM Spuštění robocopy
robocopy "%SOURCE%" "%DEST%" /MIR ^
/XD .git .pio build .vscode ^
/XF *.log *.tmp ^
/R:2 /W:2

echo.
echo Zaloha slozky: %FOLDERNAME%
echo Hotovo!
pause