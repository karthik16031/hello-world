REM  Setting up the paths

SET DS_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\DesignStudio
SET RCPTT_HOME=C:\ModelBank\TestPackage\RCPTT\rcptt
SET PATH=C:\tools\UTPTool;C:\Program Files\7-Zip;%DS_HOME%;%RCPTT_HOME%;%PATH%

REM Extracting t24 binaries and removing once extracted.

7z x %DS_HOME%\t24-binaries.zip -o%DS_HOME%\t24-binaries -y
DEL /F /Q /A %DS_HOME%\t24-binaries.zip
DEL /F /Q /A %DS_HOME%\dropins\tafj.link
xcopy %DS_HOME%\..\TAFJ\Default\eclipse\plugins %DS_HOME%\dropins\ /S /Y /i
START /B %DS_HOME%\DesignStudioT24 -data %DS_HOME%\workspace

