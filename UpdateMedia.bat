@echo off

set "currentDir=%CD%"
for %%I in ("%currentDir%") do set "folderName=%%~nxI"

set "tocFile=..\%folderName%\%folderName%.toc"
set "wagoID="

if exist "%tocFile%" (
  for /F "tokens=2 delims=:" %%A in ('findstr /B /C:"## X-Wago-ID:" "%tocFile%"') do set "wagoID=%%A"
) else (
  set /P "wagoID=Enter Wago Project ID: "
  if not exist "..\%folderName%\background" mkdir "..\%folderName%\background"
  if not exist "..\%folderName%\border" mkdir "..\%folderName%\border"
  if not exist "..\%folderName%\font" mkdir "..\%folderName%\font"
  if not exist "..\%folderName%\sound" mkdir "..\%folderName%\sound"
  if not exist "..\%folderName%\statusbar" mkdir "..\%folderName%\statusbar"

  echo ## Interface: 11505, 40401, 110005 > "%tocFile%"
  echo ## Title: %folderName% >> "%tocFile%"
  if not "%wagoID%"=="" echo ## X-Wago-ID: %wagoID% >> "%tocFile%"
  echo MyMedia.lua >> "%tocFile%"
  echo libs\LibStub\LibStub.lua >> "%tocFile%"
  echo libs\CallbackHandler-1.0\CallbackHandler-1.0.lua >> "%tocFile%"
  echo libs\LibSharedMedia-3.0\LibSharedMedia-3.0.lua >> "%tocFile%"

  echo AddOn created. Add your media files to the appropriate folders.
  echo Run this script again to register the media files and create a zip file.
  goto :endOfScript
)

echo ## Interface: 11505, 40401, 110005 > "%tocFile%"
echo ## Title: %folderName% >> "%tocFile%"
if not "%wagoID%"=="" echo ## X-Wago-ID: %wagoID% >> "%tocFile%"
echo MyMedia.lua >> "%tocFile%"
echo libs\LibStub\LibStub.lua >> "%tocFile%"
echo libs\CallbackHandler-1.0\CallbackHandler-1.0.lua >> "%tocFile%"
echo libs\LibSharedMedia-3.0\LibSharedMedia-3.0.lua >> "%tocFile%"

echo "%tocFile%"

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

:: Create the subfolder in the current working directory
if exist "%currentDir%\%folderName%" rmdir /s /q "%currentDir%\%folderName%"
if not exist "%currentDir%\%folderName%" mkdir "%currentDir%\%folderName%"

:: Copy the specified files and folders into the subfolder
xcopy "%currentDir%\MyMedia.lua" "%currentDir%\%folderName%\" /Y /Q
xcopy "%currentDir%\%folderName%.toc" "%currentDir%\%folderName%\" /Y /Q
xcopy "%currentDir%\libs" "%currentDir%\%folderName%\libs" /E /I /Y /Q
xcopy "%currentDir%\background" "%currentDir%\%folderName%\background" /E /I /Y /Q
xcopy "%currentDir%\border" "%currentDir%\%folderName%\border" /E /I /Y /Q
xcopy "%currentDir%\font" "%currentDir%\%folderName%\font" /E /I /Y /Q
xcopy "%currentDir%\sound" "%currentDir%\%folderName%\sound" /E /I /Y /Q
xcopy "%currentDir%\statusbar" "%currentDir%\%folderName%\statusbar" /E /I /Y /Q

:: Create the zip file
set "currentDir=%CD%"
for %%I in ("%currentDir%") do set "folderName=%%~nxI"
set "parentDir=%~dp0.."
set "zipFile=%currentDir%\%folderName%.zip"
if exist "%zipFile%" del "%zipFile%"
powershell -command "Compress-Archive -Path '%parentDir%\%folderName%\%folderName%\' -DestinationPath '%zipFile%' -Force"

echo Files successfully registered
echo Zip file created at %zipFile%

:: Clean up
rmdir /s /q "%currentDir%\%folderName%"

:endOfScript
pause