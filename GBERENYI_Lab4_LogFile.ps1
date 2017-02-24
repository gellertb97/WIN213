<#
Filename: GBERENYI_Lab4_Logfile.ps1
Purpose: Generate a log file containing system information
Author: Gellert Berenyi
Course: WIN213; Gurwitz, M
Lab 4
#>

#Create Variables for Log Path Directory, Log Path File, Disk Information, Bios #Information #and Installed Products (Applications) Information and Today's Date. Use CIM cmdlets 
########################################################################

$LogPath = "$HOME\Documents\Week 4\Lab 4"
$LogFilePath = "$HOME\Documents\Week 4\Lab 4\GBERENYI_Lab4_LogFile.log"
$Date = Get-Date
$DiskInfo = Get-CimInstance CIM_DiskDrive | Select-Object -Property Model,@{n='Size';e={[string][int]($_.Size/1GB)+"GB"}} | Format-List
$BiosInfo = Get-CimInstance CIM_BIOSElement | Select-Object -Property Manufacturer,Version | Format-Table -AutoSize
$AppInfo = Get-CimInstance CIM_Product | Select-Object -Property Name,Description,Version,Vendor | Sort-Object Name

#Create a Message “Gathering Machine Information <computername>. Please wait…”
#########################################################################

Write-Host "`n`n   Gathering Machine Information $env:ComputerName. Please wait...   "

#Create Log file and output Log File Title with Computer Name and Date of Report
########################################################################

Write-Output "Summary Information for computer $env:ComputerName on $Date" | Out-file -FilePath "$LogFilePath"  
Write-Output "================================================== " | Out-file -FilePath "$LogFilePath"  -append

 #Create a Disk Drive Summary Header, Get Disk Information and Output to log file
########################################################################

Write-Output "`n`n`n`n"| Out-File  "$LogFilePath" -append
Write-Output "Disk Drive Summary" |Out-file "$LogFilePath" -append
Write-Output "============================================" | Out-file "$LogFilePath"  -append
Write-Output $DiskInfo | Out-File "$LogFilePath" -Append

 #Create a Bios Summary Header, Get Bios Information and Output to log file
########################################################################

Write-Output "`n`n`n`n"| Out-File  "$LogFilePath" -append
Write-Output "Bios Summary" |Out-file "$LogFilePath" -append
Write-Output "============================================" | Out-file "$LogFilePath"  -append
Write-Output $BiosInfo | Out-File "$LogFilePath" -Append

#Create an Installed Software Summary Header, Get Product Information and Output to #log file
#######################################################################

Write-Output "`n`n`n`n"| Out-File  "$LogFilePath" -append
Write-Output "Installed Software Summary" |Out-file "$LogFilePath" -append
Write-Output "============================================" | Out-file "$LogFilePath"  -append
Write-Output $AppInfo | Out-File "$LogFilePath" -Append

#Display a Message Log File Created.
########################################################################

Write-Host "`n`n   Log file "$LogFilePath" has been generated."