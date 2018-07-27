cd C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Data\T24\UD\DW.EXPORT
for /F "tokens=1" %%a in ('dir ^| findstr "File(s)"') do echo Total Number of files == %%a >>C:\ModelBank\TestPackage\tSAAF-MBUTP\Batch\TotalFilesCheck.txt
REM CHECK folder is empty or not and if not empty create file
for /F %%i in ('dir /b /a "C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Data\T24\UD\DW.EXPORT\*.*"') do (
    echo if you see this the folder is NOT empty >>C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Data\T24\UD\DW.EXPORT\FilesAvailable.txt
    goto launch_app
)
