SET TAFJ_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\TAFJ\Default
SET JAVA_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Infra\Java\Default
cd %TAFJ_HOME%\bin
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/DW.EXPORT.SERVICE 6=STOP;
DBTools -u t24user -p t24User123! -s JQL CLEAR-FILE F.TSA.STATUS | DBTools -u t24user -p t24User123! -s JQL CLEAR-FILE F.BATCH.STATUS