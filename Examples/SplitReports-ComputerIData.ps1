<#
.SYNOPSIS
   Here we get data about the computers we are managing and test something.
.DESCRIPTION
   Here we get data about the computers we are managing and test something.
   We want to check
   - operating system information
   - BIOS information
   - Processor information

.EXAMPLE
   SplitReports-ComputerIData.ps1


.NOTES
    #Script Name
    #Creator
    #Contact Data
    #References, if any
.LINK
    http://work.haufegroup.io/
#>

#Enter Tasks Below as Remarks - Describe what each task in your script should perform.
#Task Retrieving OS, BIOS and Processor data. Aorted alphabetically in ascending order.
Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property [a-z]*

#Add the Write-Host to write not-piped messages to standard out.
Write-Host "OS report finished" -ForegroundColor Red -BackgroundColor White


Get-WmiObject -Class Win32_BIOS -ComputerName . | Select-Object -Property [a-z]*
Write-Host "BIOS report finished" -ForegroundColor Red -BackgroundColor White


Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*
Write-Host "Processor report finished" -ForegroundColor Red -BackgroundColor White
