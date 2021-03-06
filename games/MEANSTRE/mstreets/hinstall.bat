ECHO OFF
CLS

SET SRC=A
IF %0 == b:hinstall SET SRC=B
IF %0 == B:HINSTALL SET SRC=B

IF %1XXX == XXX GOTO TBEGIN
SET DRIVE=%1
GOTO BEGIN

:NODRIVE
CLS
ECHO ERROR: DRIVE %1 DOESN'T EXIST...
GOTO EXIT

:TBEGIN
ECHO YOU MUST SPECIFY THE DESTINATION HARD DRIVE LETTER (I.E. %SRC%:HINSTALL C)
GOTO EXIT

:BEGIN

ECHO THIS PROGRAM WILL INSTALL MEAN STREETS ON DRIVE %DRIVE%
ECHO PRESS CTRL-C TO ABORT, OR ANY OTHER KEY TO CONTINUE.

@jchoice
CLS

ECHO CREATING \MSTREETS SUBDIRECTORY...
MD %DRIVE%:\MSTREETS
:WAIT4FILE
IF EXIST %SRC%:INSTALL1.BAT GOTO HARDDIR
CLS
ECHO INSERT DISK 2 INTO DRIVE %SRC% ...
@jchoice
GOTO WAIT4FILE

:HARDDIR
COPY %SRC%:INSTALL1.BAT %DRIVE%:\MSTREETS
%DRIVE%:
CD \MSTREETS
INSTALL1 %SRC%

:EXIT
