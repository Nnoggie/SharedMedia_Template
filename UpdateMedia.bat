@echo off

set "currentDir=%CD%"
for %%I in ("%currentDir%") do set "folderName=%%~nxI"

set "tocFile=..\%folderName%\%folderName%.toc"
set "wagoID="

if exist "%tocFile%" (
  for /F "tokens=2 delims=:" %%A in ('findstr /B /C:"## X-Wago-ID:" "%tocFile%"') do set "wagoID=%%A"
) else (
  set /P "wagoID=Enter Wago Project ID: "
)

echo Creating the TOC...
echo ## Interface: 11503, 40400, 110000, 110002 > "%tocFile%"
echo ## Title: %folderName% >> "%tocFile%"
if not "%wagoID%"=="" echo ## X-Wago-ID: %wagoID% >> "%tocFile%"
echo MyMedia.lua >> "%tocFile%"
echo libs\LibStub\LibStub.lua >> "%tocFile%"
echo libs\CallbackHandler-1.0\CallbackHandler-1.0.lua >> "%tocFile%"
echo libs\LibSharedMedia-3.0\LibSharedMedia-3.0.lua >> "%tocFile%"

echo Creating the file...
echo local LSM = LibStub("LibSharedMedia-3.0") > ..\%folderName%\MyMedia.lua

echo    BACKGROUND
echo.>> ..\%folderName%\MyMedia.lua
echo -- ----- >> ..\%folderName%\MyMedia.lua
echo -- BACKGROUND >> ..\%folderName%\MyMedia.lua
echo -- ----- >> ..\%folderName%\MyMedia.lua
for %%F in (..\%folderName%\background\*.*) do (
echo       %%~nF
echo LSM:Register("background", "%%~nF", [[Interface\Addons\%folderName%\background\%%~nxF]]^) >> ..\%folderName%\MyMedia.lua
)

echo    BORDER
echo.>> ..\%folderName%\MyMedia.lua
echo -- ----- >> ..\%folderName%\MyMedia.lua
echo --  BORDER >> ..\%folderName%\MyMedia.lua
echo -- ---- >> ..\%folderName%\MyMedia.lua
for %%F in (..\%folderName%\border\*.*) do (
echo       %%~nF
echo LSM:Register("border", "%%~nF", [[Interface\Addons\%folderName%\border\%%~nxF]]^) >> ..\%folderName%\MyMedia.lua
)

echo    FONT
echo.>> ..\%folderName%\MyMedia.lua
echo -- ----->> ..\%folderName%\MyMedia.lua
echo --   FONT>> ..\%folderName%\MyMedia.lua
echo -- ----->> ..\%folderName%\MyMedia.lua
for %%F in (..\%folderName%\font\*.ttf) do (
echo       %%~nF
echo LSM:Register("font", "%%~nF", [[Interface\Addons\%folderName%\font\%%~nxF]]^) >> ..\%folderName%\MyMedia.lua
)

echo    SOUND
echo.>> ..\%folderName%\MyMedia.lua
echo -- ----->> ..\%folderName%\MyMedia.lua
echo --   SOUND>> ..\%folderName%\MyMedia.lua
echo -- ----->> ..\%folderName%\MyMedia.lua
for %%F in (..\%folderName%\sound\*.*) do (
echo       %%~nF
echo LSM:Register("sound", "%%~nF", [[Interface\Addons\%folderName%\sound\%%~nxF]]^) >> ..\%folderName%\MyMedia.lua
)

echo    STATUSBAR
echo.>> ..\%folderName%\MyMedia.lua
echo -- ----->> ..\%folderName%\MyMedia.lua
echo --   STATUSBAR>> ..\%folderName%\MyMedia.lua
echo -- ----->> ..\%folderName%\MyMedia.lua
for %%F in (..\%folderName%\statusbar\*.*) do (
echo       %%~nF
echo LSM:Register("statusbar", "%%~nF", [[Interface\Addons\%folderName%\statusbar\%%~nxF]]^) >> ..\%folderName%\MyMedia.lua
)

pause