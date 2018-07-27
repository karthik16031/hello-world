SET AUT=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\DesignStudio
SET RUNNER=C:\ModelBank\TestPackage\RCPTT\rcptt_Runner
SET PROJECT=C:\ModelBank\TestPackage\RCPTT\rcptt\MBUTPSanity
SET RESULTS=C:\ModelBank\TestPackage\RCPTT\rcptt\Results

java -jar %RUNNER%/eclipse/plugins/org.eclipse.equinox.launcher_1.3.200.v20160318-1642.jar ^
 -application org.eclipse.rcptt.runner.headless ^
 -testOptions 'testExecTimeout=1000' ^
 -data %RESULTS%/runner-workspace/ ^
 -aut %AUT% ^
 -autWsPrefix %RESULTS%/aut-workspace ^
 -autConsolePrefix %RESULTS%/aut-output ^
 -htmlReport %RESULTS%/report.html ^
 -junitReport %RESULTS%/report.xml ^
 -import %PROJECT% ^
 -autVMArgs -Degen.options.useNewEnqResultsTableColWidthEqualizationMethod=true; -Degen.options.forceGeneration=Y; -Degen.options.componentOutputLocation=C:/ModelBank/InstallPackageOutput/Temenos/R19/Env/Slot01/Products/BRP/generated/edge/DynamicComponents; -Dds.t24.gen.edge.datadir=C:/ModelBank/InstallPackageOutput/Temenos/R19/Env/Slot01/Products/BRP/generated/edge/data; -Dds.t24.gen.iris.outdir=C:/ModelBank/InstallPackageOutput/Temenos/R19/Env/Slot01/Products/BRP/generated/iris; -Dds.t24.AvailableTranslationLanguagesEsonFilepath=C:/ModelBank/InstallPackageOutput/Temenos/R19/Env/Slot01/Products/DesignStudio/workspace/BRP-models/Components/EB_ModelBank/Public/AvailableTranslationLanguages.eson