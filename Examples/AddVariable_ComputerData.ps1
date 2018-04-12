<#
.SYNOPSIS
   Here we get data about the computers we are managing and create a report to test something

.DESCRIPTION
   Here we get data about the computers we are managing and create a report to test something
   We want to check
   - operating system information
   - BIOS information
   - Processor information

.EXAMPLE
   AddVariable_ComputerData.ps1

.OUTPUTS
    stdout

.NOTES
    #Script Name
    #Creator
    #Contact Data
    #References, if any
.LINK
    http://work.haufegroup.io/
#>



#Variables
$ComputerName = "HGDECLFR002397","."
$ComputerInfo = "Win32_OperatingSystem", "Win32_BIOS", "Win32_Processor"
if ($ComputerName -eq "")
{
$ComputerName = "."
}

#Enter Tasks Below as Remarks - Describe what each task in your script should perform.

#Task Retrieving OS, BIOS and Processor data for 1 or more computers. Loop through all ComputerInfos for all ComputerNames.
foreach ($name in $ComputerName)
{

foreach($info in $ComputerInfo)
{
    Get-WmiObject -Class $info -ComputerName $ComputerName | Select-Object -Property [a-z]*
    Write-Host $info + "report finished" -ForegroundColor Red -BackgroundColor White
}
}



