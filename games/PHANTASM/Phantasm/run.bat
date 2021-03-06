:menu
echo off
cls
echo.
echo Press 1 for Phantasmagoria w/ SoundBlaster
echo Press 2 for Phantasmagoria w/ MT-32
echo Press 3 for Phantasmagoria w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
cd SCARYDOS
del RESOURCE.CFG
xcopy .\sb16\*.*
cls
SIERRA
goto quit

:MT32
mt32-pi -m -v
cd SCARYDOS
del RESOURCE.CFG
xcopy .\mt32\*.*
cls
SIERRA
goto quit

:SC55
mt32-pi -g -v
cd SCARYDOS
del RESOURCE.CFG
xcopy .\sc55\*.*
cls
SIERRA
goto quit

:quit
exit