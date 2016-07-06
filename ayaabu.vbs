' 
'DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
'                    Version 2, December 2004 
'Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 
'Everyone is permitted to copy and distribute verbatim or modified 
'copies of this license document, and changing it is allowed as long 
'as the name is changed. 
'           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
' TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
'
'0. You just DO WHAT THE FUCK YOU WANT TO.'
'
'         ///\\\  ( Have Fun )
'        ( ^  ^ ) /
'      __(  __  )__
'     / _ `----' _ \
'     \__\   _   |__\
'      (..) _| _ (..)
'       |____(___|     Mynameisv_ 2016
'_ __ _ (____)____) _ _________________________________ _
' 
'_______________________________________________________________________________
'     __   _  _   __      __    ____  __  __ 
'    /__\ ( \/ ) /__\    /__\  (  _ \(  )(  )
'   /(__)\ \  / /(__)\  /(__)\  ) _ < )(__)( 
'  (__)(__)(__)(__)(__)(__)(__)(____/(______) v0.1
'    All  Your Antivirus  Are  Belong to Us
'_______________________________________________________________________________
'
'
' What is this thing !!?
' -----------------------
' It is a funny trick, following the RUMP "Fighting malware like a boss" at
' SSTIC 2016
' https://www.sstic.org/2016/presentation/2016_rumps/
' The idea is as simple as effective: some malwares check for antivirus and quit
' if some antivirus are found.
' AYAABU insert many antivirus in your WMI database to fake their installation.
'
'
' VBS !!?
' -----------------------
' Yes, why not ;-)
'
'
' Is it safe ?
' -----------------------
' My code is safe.
' If the question is "can i do what the fuck i want with this configurarion?"
' The answer is... seriously, are you really asking this question !!?
'
'
' Usage
' -----------------------
' /!\ Must be run as administrator
'
' To fake the installation, in last group of lines :
' -> comment  : DeleteWMIObject(sAvName)
' -> uncomment: AddWMIObject(sAvName)
' and double-clic or execute by command line
'
' To remove that shit, in last group of lines, comment :
' -> uncomment: DeleteWMIObject(sAvName)
' -> comment  : AddWMIObject(sAvName)
' and double-clic or execute by command line
'
'To Check the installation, run the following command line :
'>WMIC /Node:localhost /Namespace:\\root\SecurityCenter2 Path AntiVirusProduct Get
'
' ----------------------------------
' Delete an existing object
' ----------------------------------
Function DeleteWMIObject(sName)
	'Set oService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\SecurityCenter2")
	Set oService = GetObject("Winmgmts:\\.\root\SecurityCenter2")
	'Set oData = oService.Get("AntiVirusProduct")
	Set oData = oService.ExecQuery("Select * from AntiVirusProduct")
	for Each  sItem in oData
		if sItem.displayName = sName then
			sItem.Delete_
			'wscript.echo "Entry: " & sName & " -> deleted successfully"
		End If
	next
End Function

' ----------------------------------
' Add an object
' ----------------------------------
Function AddWMIObject(sName)
	Set oService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\SecurityCenter2")
	Set oData = oService.Get("AntiVirusProduct") 
	Set oInstance = oData.SpawnInstance_ 
	oInstance.displayName = sName
	Set TypeLib = CreateObject("Scriptlet.TypeLib")
	oInstance.instanceGuid = TypeLib.Guid
	oInstance.pathToSignedProductExe = "c:\windows\notepad.exe"
	oInstance.pathToSignedReportingExe = "c:\windows\notepad.exe"
	'Antivirus + Running + Up to date = 266240 / 0x041000
	oInstance.productState = 266240
	oInstance.Put_()
	'wscript.echo "Entry: " & oInstance.displayName & " / " & oInstance.instanceGuid & " -> added successfully"
End Function

' ----------------------------------
' All fucking antivirus !!!
' ----------------------------------
Dim listItems
listItems = Array("avast! Antivirus", _
	"AVG AntiVirus Free Edition 2014", _
	"Avira Desktop", _
	"Bitdefender Antivirus", _
	"COMODO Antivirus", _
	"ESET Endpoint Antivirus 5.0", _
	"ESET Endpoint Security 5.0", _
	"ESET NOD32 Antivirus 6.0", _
	"ESET Smart Security 5.2", _
	"ESET Smart Security 7.0", _
	"F-Secure PSB Workstation Security", _
	"Kaspersky Endpoint Security 10 for Windows", _
	"Kaspersky Internet Security", _
	"Malwarebytes Anti-exploit", _
	"Malwarebytes Anti-Malware", _
	"McAfee VirusScan Enterprise", _
	"Microsoft Security Essentials", _
	"Norton 360 Online", _
	"Norton AntiVirus", _
	"Qihoo 360", _
	"Sophos Anti-Virus", _
	"Symantec Endpoint Protection", _
	"Trend Micro OfficeScan Antivirus", _
	"Trend Micro Security Agent")

' ----------------------------------
' Magic loop :-D
' ----------------------------------
for each sAvName in listItems
	AddWMIObject(sAvName)
	'DeleteWMIObject(sAvName)
next