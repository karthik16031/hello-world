#include <File.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <AutoItConstants.au3>
#include <ScreenCapture.au3>

;Function to close the script errors
Func closescriptwindow()

     If WinExists("Script Error") Then
        WinClose("Script Error", "")
    EndIf
 EndFunc



Local $Exepath = IniRead("../MBTest.properties","Section","Exepath", "NotFound")
Local $InstPath = IniRead("../MBTest.properties","Section","InstPath", "NotFound")
$dirpart1 = StringTrimRight(@ScriptDir, 8)&"\Reports\Install\"
$Finallog = StringTrimRight(@ScriptDir, 8)&"\Reports\Finallog.log"
Global $mpath=$InstPath&"\Temenos\R19\Env\Slot01\manifest.html"
 Local $iFileExists = FileExists ($mpath)
 If $iFileExists Then
 ;MsgBox($MB_SYSTEMMODAL, "", "Installation Completed Sucessfully." & @CRLF & "FileExist returned: " & $iFileExists)
		_WriteReportLog("Status1=PASS")
		;;ShellExecute("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Common\Scripts\Slot01\StartUp.bat")
_ScreenCapture_Capture($dirpart1  & "ManifestSH.jpg")
   Else
        ;MsgBox($MB_SYSTEMMODAL, "", "Installation Failed Manifest file not created." & @CRLF & "FileExist returned: " & $iFileExists)

		_WriteReportLog("Status1=FAIL")
_ScreenCapture_Capture($dirpart1  & "ManifestSH.jpg")
   EndIf


; Documents Test
ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R19-Docs & Tools\Documents")
WinWaitActive("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$dirpart1 = StringTrimRight(@ScriptDir, 8)&"\Reports\Document_Hta_Test\"
$Finallog = StringTrimRight(@ScriptDir, 8)&"\Reports\Finallog.log"
;_ScreenCapture_Capture($dirpart1 & "ReleaseHighlights.jpg")
;MsgBox(0,$Finallog,$Finallog)

; Release Highlights Test
$X = WinActive ("Release")
$Y = WinActive ("C:\ModelBank")
IF $X Then
	;MsgBox(0,"","Working")
	_WriteReportLog("Status4.1=PASS")
	_WriteErrorLog("Release Highlights --Working")
	_ScreenCapture_Capture($dirpart1 & "ReleaseHighlights.jpg")
	WinClose("Release", "")

ElseIf $Y Then
  ; MsgBox(0,"","Working")
	_WriteReportLog("Status4.1=PASS")
	_WriteErrorLog("Release Highlights --Working")
	_ScreenCapture_Capture($dirpart1 & "ReleaseHighlights.jpg")
	WinClose("C:\ModelBank", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteErrorLog("Release Highlights Not Working")
	_WriteReportLog("Status4.1=FAIL")
	_ScreenCapture_Capture($dirpart1 & "ReleaseHighlights.jpg")
    closescriptwindow()

EndIf

;Feature List Test
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Y = WinActive ("Feature List")
$A = WinActive ("Topic - Feature")
IF $Y Then
	;MsgBox(0,"","Working")
	_WriteErrorLog("Feature List.pdf openinig")
	_ScreenCapture_Capture($dirpart1 & "FeatureList.jpg")
	_WriteReportLog("Status4.2=PASS")
	WinClose("Feature List", "")

	 ElseIf $A Then
	;MsgBox(0,"","Working")
	_WriteErrorLog("Feature List.pdf openinig")
	_ScreenCapture_Capture($dirpart1 & "FeatureList.jpg")
	_WriteReportLog("Status4.2=PASS")
	WinClose("Topic - Feature", "")

Else
	;MsgBox(0,"","Not Working")
	_WriteErrorLog("Feature List.pdf not openinig")
	_ScreenCapture_Capture($dirpart1 & "FeatureList.jpg")
	_WriteReportLog("Status4.2=FAIL")
	closescriptwindow()
EndIf

;Password Document check
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("Password Details")
IF $Z Then
	;MsgBox(0,"","Working")
	_WriteErrorLog("Password Details openinig")
	_ScreenCapture_Capture($dirpart1 & "PasswordDetails.jpg")
	_WriteReportLog("Status4.3=PASS")
	WinClose("Password Details", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteErrorLog("Password Details.pdf not openinig")
	_ScreenCapture_Capture($dirpart1 & "PasswordDetails.jpg")
	_WriteReportLog("Status4.3=FAIL")
	closescriptwindow()
EndIf

;Demo Guides Test
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("Model")
$Y = WinActive ("C:\ModelBank")
IF $Z Then
	;MsgBox(0,"","Working")
	_WriteErrorLog("Demo Guide Folder is openinig")
	_ScreenCapture_Capture($dirpart1 & "DemoGuide.jpg")
	_WriteReportLog("Status4.4=PASS")
	WinClose("Model", "")

	ElseIf $Y Then
   ;MsgBox(0,"","Working")
	_WriteErrorLog("Demo Guide Folder is openinig")
	_ScreenCapture_Capture($dirpart1 & "DemoGuide.jpg")
	_WriteReportLog("Status4.4=PASS")
	WinClose("C:\ModelBank", "")


Else
	;MsgBox(0,"","Not Working")
	_WriteErrorLog("Demo Guide Folder is not openinig")
	_WriteReportLog("Status4.4=FAIL")
	_ScreenCapture_Capture($dirpart1 & "DemoGuide.jpg")
	_WriteReportLog("Model")
	closescriptwindow()
EndIf


;Technology Guides Test
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
Send("{ENTER}")
Sleep(5000)
Opt("WinTitleMatchMode",1)
$Z = WinActive ("Technology - Default")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteErrorLog("Technology  Guide  is openinig")
	_ScreenCapture_Capture($dirpart1 & "TechnologyGuide.jpg")
	_WriteReportLog("Status4.5=PASS")

	WinClose("Technology - Default", "")
Else
	;MsgBox(0,$Z,"Not Working")
	_WriteErrorLog("Technology  Guide  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "TechnologyGuide.jpg")
	_WriteReportLog("Status4.5=FAIL")
	closescriptwindow()
EndIf

;Add In Setup Test
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("Setup")
$Y = WinActive ("C:\ModelBank")
IF $Z Then
	 ;MsgBox(0,"","Working")
	_WriteErrorLog("Add in setup  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Addinsetup.jpg")
	_WriteReportLog("Status4.6=PASS")
	WinClose("Setup", "")


	ElseIf $Y Then
   ;MsgBox(0,"","Working")
	_WriteErrorLog("Add in setup  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Addinsetup.jpg")
	_WriteReportLog("Status4.6=PASS")

	WinClose("C:\ModelBank", "")

Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status4.6=FAIL")
	_WriteErrorLog("Add in setup  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "Addinsetup.jpg")

	closescriptwindow()
EndIf

;User Guides Test
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("Temenos Documentation")
IF $Z Then
	;MsgBox(0,"","Working")
	_WriteErrorLog("User Guides  are openinig")
	_ScreenCapture_Capture($dirpart1 & "UserGuides.jpg")
	_WriteReportLog("Status4.7=PASS")
	WinClose("Temenos Documentation", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteErrorLog("User Guides  are not openinig")
	_ScreenCapture_Capture($dirpart1 & "UserGuides.jpg")
	_WriteReportLog("Status4.7=FAIL")
	closescriptwindow()
EndIf


;Downloads Test
WinActivate("Documentation")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("Distribution")
IF $Z Then
	;MsgBox(0,"","Working")
	_WriteErrorLog("Download is  openinig")
	_ScreenCapture_Capture($dirpart1 & "Download.jpg")
	_WriteReportLog("Status4.8=PASS")
	WinClose("Distribution", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteErrorLog("Download is  not openinig")
	_ScreenCapture_Capture($dirpart1 & "Download.jpg")
	_WriteReportLog("Status4.8=FAIL")
	closescriptwindow()

EndIf
WinActivate("Documentation")
	WinClose("Documentation", "")

;Design Studio Test
ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R19-Docs & Tools\Design Studio")
$dirpart1 = StringTrimRight(@ScriptDir, 8)&"\Reports\DesignStudio_Test\"
$Finallog = StringTrimRight(@ScriptDir, 8)&"\Reports\Finallog.log"
Sleep(16000)
;Send("{ENTER}")
;sleep(7000)
WinActivate("workspace")
$Z = WinActive ("Eclipse Launcher")
$Y=WinActive ("workspace")
$X=WinActive ("Workspace Unavailable")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status6.1=PASS")
	_WriteErrorLog("Design Studio  is openinig")
	_ScreenCapture_Capture($dirpart1 & "DesignStudio.jpg")
	Send("{ENTER}")
	Sleep(10000)
	Send("{ENTER}")
	Sleep(50000)
	Opt("WinTitleMatchMode",1)
	Send("{ENTER}")
	;WinClose("Eclipse Launcher", "")
 ElseIf $Y Then
	;MsgBox(0,$Y,"Working")
	_WriteReportLog("Status6.1=PASS")
	_WriteErrorLog("Design Studio  is openinig")
	_ScreenCapture_Capture($dirpart1 & "DesignStudio.jpg")
	Send("{ENTER}")
	Sleep(10000)
	Send("{ENTER}")
	Sleep(50000)
	Opt("WinTitleMatchMode",1)
	Send("{ENTER}")
	WinClose("workspace", "")
	Send("{ENTER}")
ElseIf $X Then
	;MsgBox(0,$X,"Working")
	_WriteReportLog("Status6.1=PASS")
	_WriteErrorLog("Design Studio  is openinig")
	_ScreenCapture_Capture($dirpart1 & "DesignStudio.jpg")
	Send("{ENTER}")
	Sleep(10000)
	Send("{ENTER}")
	Sleep(50000)
	Opt("WinTitleMatchMode",1)
	Send("{ENTER}")
	WinClose("Workspace Unavailable", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status6.1=FAIL")
	_WriteErrorLog("Design Studio is not openinig")
	_ScreenCapture_Capture($dirpart1 & "DesignStudioNW.jpg")
	closescriptwindow()
	;ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R18-Docs & Tools\Design Studio")
EndIf


;MB Tools Test
;Hermes test
ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R19-Docs & Tools\Utilities")
WinWaitActive("Model Bank Tools")
Send("{TAB}")
Send("{ENTER}")
Sleep(30000)
$Z = WinActive ("HermesJMS")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status7.1=PASS")
	_WriteErrorLog("HermesJMS window  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Hermes.jpg")
	WinClose("HermesJMS", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status7.1=FAIL")
	_WriteErrorLog("HermesJMS window is not openinig")
	_ScreenCapture_Capture($dirpart1 & "Hermes.jpg")
	closescriptwindow()
EndIf

;Soup Test
Sleep(3000)
WinActivate("Model Bank Tools")
Send("{TAB}")
Send("{ENTER}")
Sleep(30000)
$Z = WinActive ("SoapUI")
$Y=WinActive ("New Version Check")
$M = WinActive ("Usage statistics")
$N = WinActive ("Stay Tuned!")

IF $Z Then
   _WriteReportLog("Status7.2=PASS")
	;MsgBox(0,$Z,"Working")
	_WriteErrorLog("SoapUI  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Soap.jpg")
	;WinClose("SoapUI", "")
 ElseIf $Y Then
	   _WriteReportLog("Status7.2=PASS")
	;MsgBox(0,$Z,"Working")
	_WriteErrorLog("SoapUI  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Soap.jpg")
	;WinClose("New Version Check", "")
 ElseIf $M Then
	    _WriteReportLog("Status7.2=PASS")
	;MsgBox(0,$Z,"Working")
	_WriteErrorLog("SoapUI  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Soap.jpg")
	;WinClose("Usage statistics", "")
	ElseIf $N Then
	    _WriteReportLog("Status7.2=PASS")
	;MsgBox(0,$Z,"Working")
	_WriteErrorLog("SoapUI  is openinig")
	_ScreenCapture_Capture($dirpart1 & "Soap.jpg")
	;WinClose("Stay Tuned!", "")
	Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status7.2=FAIL")
	_WriteErrorLog("SoapUI  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "Soap.jpg")
	closescriptwindow()
 EndIf

;Squirrel Test
Sleep(3000)
WinActivate("Model Bank Tools")
Send("{TAB}")
;Send("{TAB}")
Send("{ENTER}")
Sleep(10000)
Opt("WinTitleMatchMode",1)
$Z = WinActive ("SQuirreL")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status7.3=PASS")
	_WriteErrorLog("SQuirreL   is openinig")
	_ScreenCapture_Capture($dirpart1 & "SQuirreL.jpg")
	WinClose("SQuirreL", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status7.3=FAIL")
	_WriteErrorLog("SQuirreL  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "SQuirreL.jpg")
	closescriptwindow()
EndIf


;Wintail Test
WinActivate("Model Bank Tools")
Send("{TAB}")
Send("{ENTER}")
Sleep(3000)
$Z = WinActive ("Wintail")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status7.4=PASS")
	_WriteErrorLog("Wintail   is openinig")
	_ScreenCapture_Capture($dirpart1 & "Wintail.jpg")
	WinClose("Wintail", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status7.4=FAIL")
	_WriteErrorLog("Wintail  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "Wintail.jpg")
	closescriptwindow()
 EndIf
WinActivate("Model Bank Tools")
WinClose("Model Bank Tools", "")


;Xtras test
ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R19-Docs & Tools\Xtra")
WinWaitActive("Xtras-Non UTP Products")

;TCUA Test
Sleep(3000)
WinActivate("Xtras-Non UTP Products")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("TCUA")
$Y = WinActive ("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\Xtras\TCUA")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status5.1=PASS")
	_WriteErrorLog("TCUA  is openinig")
	_ScreenCapture_Capture($dirpart1 & "\TCUA.jpg")
	WinClose("TCUA", "")
 ElseIf $Y Then

	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status5.1=PASS")
	_WriteErrorLog("TCUA  is openinig")
	_ScreenCapture_Capture($dirpart1 & "\TCUA.jpg")
	WinClose("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\Xtras\TCUA", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status5.1=FAIL")
	_WriteErrorLog("TCUA  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "\TCUANW.jpg")
	closescriptwindow()
EndIf

;TOCFEE TEST
 WinActivate("Xtras-Non UTP Products")
Send("{TAB}")
Send("{ENTER}")
Sleep(5000)
$Z = WinActive ("TOCFEE")
$Y = WinActive ("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\Xtras\TOCFEE")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status5.4=PASS")
	_WriteErrorLog("TOCFEE  is openinig")
	_ScreenCapture_Capture($dirpart1 & "\TOCFEE.jpg")
	WinClose("TOCFEE", "")
 ElseIf $Y Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status5.4=PASS")
	_WriteErrorLog("TOCFEE  is openinig")
	_ScreenCapture_Capture($dirpart1 & "\TOCFEE.jpg")
	WinClose("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\Xtras\TOCFEE", "")
Else
	;MsgBox(0,"","Not Working")
_WriteReportLog("Status5.4=FAIL")
	_WriteErrorLog("TOCFEE  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "\TOCFEE.jpg")
	closescriptwindow()
EndIf

;FCM TEST
WinActivate("Xtras-Non UTP Products")
Send("{TAB}")
Send("{ENTER}")
Sleep(3000)
$Z = WinActive ("FCM")
$Y = WinActive ("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\Xtras\FCM")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status5.5=PASS")
	_WriteErrorLog("FCM folder  is openinig")
	_ScreenCapture_Capture($dirpart1 & "\FCM.jpg")
	WinClose("FCM", "")
 ElseIf $Y Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status5.5=PASS")
	_WriteErrorLog("FCM folder  is openinig")
	_ScreenCapture_Capture($dirpart1 & "\FCM.jpg")
	WinClose("C:\ModelBank\InstallPackageOutput\Temenos\R19\Env\Slot01\Products\Xtras\FCM", "")
	WinWaitActive("Xtras-Non")
	WinClose("Xtras-Non", "")

Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status5.5=FAIL")
	_WriteErrorLog("FCM folder is not openinig")
	_ScreenCapture_Capture($dirpart1 & "\FCMNW.jpg")
	closescriptwindow()
EndIf


;TAFJ SHELL TEST
Sleep(3000)
ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R19-Docs & Tools\TAFJ Shell")
;;WinWaitActive("TAFJ Shell")
Sleep(8000)
;;WinActivate("TAFJ Shell")
;;Send("{TAB}")
;;Send("{ENTER}")
;;Sleep(5000)
$Z = WinActive ("TAFJ Shell")
$Y = WinActive ("Administrator")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status9.1=PASS")
	_WriteErrorLog("TAFJ Shell  is openinig")
	_ScreenCapture_Capture($dirpart1 & "TAFJ Shell.jpg")
	WinClose("TAFJ Shell", "")
 ElseIf $Y Then
	;MsgBox(0,$Y,"Working")
	_WriteReportLog("Status9.1=PASS")
	_WriteErrorLog("TAFJ Shell  is openinig")
	_ScreenCapture_Capture($dirpart1 & "TAFJ Shell.jpg")
	WinClose("Administrator", "")

Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status9.1=FAIL")
	_WriteErrorLog("TAFJ Shell  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "TAFJ Shell.jpg")
	closescriptwindow()
EndIf







;TAFJEE Servlet Test
ShellExecute("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Model Bank R19-Docs & Tools\TAFJEE")
;;WinWaitActive("TAFJ Shell")


Sleep(8000)
;;WinActivate("TAFJ Shell")
;;Send("{TAB}")
;;Send("{ENTER}")
;;Sleep(5000)
$Z = WinActive ("TAFJEE - Home")
IF $Z Then
	;MsgBox(0,$Z,"Working")
	_WriteReportLog("Status8.1=PASS")
	_WriteErrorLog("TAFJ UI  is openinig")
	_ScreenCapture_Capture($dirpart1 & "TAFJUI.jpg")
	WinClose("TAFJEE - Home", "")
Else
	;MsgBox(0,"","Not Working")
	_WriteReportLog("Status8.1=FAIL")
	_WriteErrorLog("TAFJ UI  is not openinig")
	_ScreenCapture_Capture($dirpart1 & "TAFJUI.jpg")
	closescriptwindow()
EndIf


Func _WriteErrorLog($ErrorMessage)
    FileWriteLine($dirpart1 &  @ScriptName & ".log", @HOUR & ":" & @MIN & ":" & @SEC & ": " & $ErrorMessage)
 EndFunc



Func _WriteReportLog($ErrorMessage)
    FileWriteLine($Finallog,$ErrorMessage)
 EndFunc
 ShellExecute("C:\ModelBank\TestPackage\AutoIT\run.bat","",@SW_SHOWNORMAL)