SET tSSAF_HOME=%CD%\
SET JAVA_HOME=%tSSAF_HOME%..\..\InstallPackageOutput\Temenos\R19\Infra\Java\Default
SET TAFJ_HOME=%tSSAF_HOME%..\..\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\TAFJ\Default\bin
SET PATH=%JAVA_HOME%\bin;%JBOSS_HOME%;%TAFJ_HOME%\bin;%PATH%
echo %tSSAF_HOME%
CD %tSSAF_HOME%..\..\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\TAFJ\Default\JMSInjector\bin
JMSSender -i t24OFSQueue -fn %tSSAF_HOME%Batch\CUSTOMER.OFS
