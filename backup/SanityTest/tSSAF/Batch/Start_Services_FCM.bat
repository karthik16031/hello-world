SET TAFJ_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\TAFJ\Default
SET JAVA_HOME=C:\ModelBank\InstallPackageOutput\Temenos\R19\Infra\Java\Default
cd %TAFJ_HOME%\bin
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/CHECK.FILTER.STATUS.SERVICE 6=AUTO;
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/INTEGRATION.SERVICE 6=AUTO;
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/PAYMENT.STPFLOW.HEAVY 6=AUTO;
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/PP.ACCEPT.MAP.SERVICE 6=AUTO;
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/OFS.MESSAGE.SERVICE 6=AUTO;
CALL DBTOOLS -s -u t24user -p t24User123! JED -s F.TSA.SERVICE BNK/OFS.MESSAGE.SERVICE 6=AUTO;