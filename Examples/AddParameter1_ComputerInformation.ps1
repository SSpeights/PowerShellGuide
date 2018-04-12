<#
.SYNOPSIS
   Here we get data about the computers we are managing and create a report to test something
.DESCRIPTION
   Here we get data about the computers we are managing and create a report to test something
   We want to check
   - operating system information
   - BIOS information
   - Processor information

.PARAMETER ComputerName
    List of system names (Array of String). Retrieve data from these systems.

.EXAMPLE
   Add_Parameter1.ps1 (Get-Content MyComputerNames.txt)

.INPUTS
    A text file with managed system names. One system name per line.

.OUTPUTS
    OS, BIOS, Processer information about each system to STDOUT.

.NOTES
    #ScriptName
    #Creator
    #Contact Data
    #References, if any

.LINK
    http://work.haufegroup.io/
#>


#Variables
$ComputerInfo = "Win32_OperatingSystem", "Win32_BIOS", "Win32_Processor"

#Parameters
#This holds the list of computers for data retrieval
param( [string[]]$ComputerName )

#handling logic for an empty parameter.
if ($ComputerName.Length-eq 0)
{
$ComputerName = "."
}

#Enter Tasks Below as Remarks - Describe what each task in your script should perform.
#Task Retrieving OS, BIOS and Processor data for 1 or more computers. Loop through all ComputerInfos for all ComputerNames in ComputerName Parameter

foreach ($name in $ComputerName)
{
foreach($info in $ComputerInfo)
{
    Get-WmiObject -Class $info -ComputerName $ComputerName | Select-Object -Property [a-z]*
    Write-Host $info + "report finished" -ForegroundColor Red -BackgroundColor White

}
}



