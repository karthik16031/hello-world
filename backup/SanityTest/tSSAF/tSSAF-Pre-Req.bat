REM  Setting up the paths

SET DEPLOYMENTS_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\deployments
SET DS_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\DesignStudio
SET T24_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Data\T24
SET RCPTT_HOME=C:\ModelBank\TestPackage\RCPTT\rcptt
SET SELE_HOME=C:\ModelBank\TestPackage\tSAAF-MBUTP
SET PATH=C:\tools\UTPTool;C:\Program Files\7-Zip;%SELE_HOME%;%DEPLOYMENTS_HOME%;%T24_HOME%;%RCPTT_HOME%PATH%

REM ADHOC Changes
MKDIR %T24_HOME%\UD\F.DL.DATA\DL.RESTORE

REM Copying DL pack, TWS war and IRIS wars to the respective locations

7z x %SELE_HOME%\TMNS000-MB.DLPACK.7z -o%T24_HOME%\UD\F.DL.DATA\DL.RESTORE\ TMNS000-MB.DLPACK -y
COPY %RCPTT_HOME%\Results\MBUTPTWSProject.war %DEPLOYMENTS_HOME%
COPY %DS_HOME%\workspace\Test-iris\target\Test-iris.war %DEPLOYMENTS_HOME%
COPY  %SELE_HOME%\Batch\CUSTOMER.OFS.tpr %T24_HOME%\UD\tcupload\BFL\ofsrequests

