SET Products=C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products
CD %Products%\Xtras\FCM\
start FCM_Server_Start.bat
ping 127.0.0.1 -n 100 > nul
CD Bridge
start launch.bat