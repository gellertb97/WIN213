<#
Filename: GBERENYI_Lab4_WWW.ps1"
Purpose: Create and launch html file by redirecting text and invoking file
Author: Gellert Berenyi
Course: Win213; Gurwitz, M
Lab 4
#>

$WebFilePath = "$HOME\Documents\Week 4\Lab 4\GBERENYI_Lab4_WebPage.html"
"<!DOCTYPE HTML PUBLIC `"-//W3C//DTD HTML 4.01 Transitional//EN`"" > "$WebFilePath"
"<HTML>" >> "$WebFilePath"
"<Head><style>BODY{background-color:peachpuff;}</style></HEAD>" >> "$WebFilePath"
"<BODY>" >> "$WebFilePath"
"<H1>PowerShell Scripted Web Page</H1>" >> "$WebFilePath"
"</BODY>" >> "$WebFilePath"
"</HTML>" >> "$WebFilePath"
Invoke-Item "$WebFilePath"