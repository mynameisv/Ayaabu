 
DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
                    Version 2, December 2004 
Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 
Everyone is permitted to copy and distribute verbatim or modified 
copies of this license document, and changing it is allowed as long 
as the name is changed. 
           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
 TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

0. You just DO WHAT THE FUCK YOU WANT TO.'

         ///\\\  ( Have Fun )
        ( ^  ^ ) /
      __(  __  )__
     / _ `----' _ \
     \__\   _   |__\
      (..) _| _ (..)
       |____(___|     Mynameisv_ 2016
_ __ _ (____)____) _ _________________________________ _
' 
_______________________________________________________________________________
     __   _  _   __      __    ____  __  __ 
    /__\ ( \/ ) /__\    /__\  (  _ \(  )(  )
   /(__)\ \  / /(__)\  /(__)\  ) _ < )(__)( 
  (__)(__)(__)(__)(__)(__)(__)(____/(______) v0.1
    All  Your Antivirus  Are  Belong to Us
_______________________________________________________________________________


What is this thing !!?
-----------------------
 It is a funny trick, following the RUMP "Fighting malware like a boss" at
 SSTIC 2016
 https://www.sstic.org/2016/presentation/2016_rumps/
 The idea is as simple as effective: some malwares check for antivirus and quit
 if some antivirus are found.
 AYAABU insert many antivirus in your WMI database to fake their installation.


VBS !!?
-----------------------
 Yes, why not ;-)


Is it safe ?
-----------------------
 My code is safe.
 If the question is "can i do what the fuck i want with this configurarion?"
 The answer is... seriously, are you really asking this question !!?


Usage
-----------------------
 To fake the installation, in last group of lines :
 -> comment  : DeleteWMIObject(sAvName)
 -> uncomment: AddWMIObject(sAvName)
 and double-clic or execute by command line

 To remove that shit, in last group of lines, comment :
 -> uncomment: DeleteWMIObject(sAvName)
 -> comment  : AddWMIObject(sAvName)
 and double-clic or execute by command line
