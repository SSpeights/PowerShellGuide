<#
.SYNOPSIS
   Here we get data about the computers we are managing. We use this data to test something.
.DESCRIPTION
   Here we get data about the computers we are managing
   We want to check
   - operating system information
   - BIOS information
   - Processor information

    We use this data to test something.

.EXAMPLE
   Base_ComputerData.ps1

.OUTPUTS
    STDOUT
.NOTES
    #Script Name
    #Creator
    #Contact Data
    #References, if any

.LINK
    http://work.haufegroup.io/
#>

#Enter Tasks Below as Remarks - Describe what each task in your script should perform.
#Task Retrieving all OS, BIOS and Processor data for this system. Create new object with properties sorted alphabetically in ascending order
Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property [a-z]*
Get-WmiObject -Class Win32_BIOS -ComputerName . | Select-Object -Property [a-z]*
Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*
