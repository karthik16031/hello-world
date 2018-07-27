cd C:\ModelBank\TestPackage\tSAAF-MBUTP\HTMLResults\
FOR /D %%X IN (C:\ModelBank\TestPackage\tSAAF-MBUTP\HTMLResults\Run*) DO RD /S /Q "%%X"
cd /D C:\ModelBank\TestPackage\tSAAF-MBUTP
START tSSAF.exe