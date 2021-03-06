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
    List of system names (Array of String). Usually, read in from a file. Retrieve data from these systems.
    If reading from a file and using Get-Content cmdlet, the file must have one system name per line.

.EXAMPLE
   CreateObject-OutputToFile_ComputerData.ps1 (Get-Content MyComputerNames.txt)

.INPUTS
    A text file with managed system names. One system name per line.

.OUTPUTS
    OS, BIOS, Processer information about each system as STDOUT and as CSV file.

.NOTES
    #CreateObject-OutputToFile_ComputerData.ps1
    #Speightss
    #Speightss@haufe.com

.LINK
    http://work.haufegroup.io/
#>

#Parameters
#This holds the list of computers read in from the command prompt
param( [string[]]$ComputerName )

if ($ComputerName.Length-eq 0)#handling logic for an empty parameter.
{
$ComputerName = "."
}

#Enter Tasks Below as Remarks - Describe what each task in your script should perform.
#Task Retrieving OS, BIOS and Processor data for 1 or more computers. Loop through all ComputerInfos for all ComputerNames in ComputerName Parameter
foreach ($name in $ComputerName)
{
 #Store selected data in variable. Properties selected with SelectObject
 $OS = Get-WmiObject -Class "Win32_OperatingSystem" -ComputerName $ComputerName | Select-Object -Property Status, Caption
 $BIOS = Get-WmiObject -Class "Win32_BIOS" -ComputerName $ComputerName | Select-Object -Property Manufacturer, Version
 $PROC =  Get-WmiObject -Class "Win32_Processor" -ComputerName $ComputerName | Select-Object -Property Name, NumberOfCores

 #Create an ordered hash table to store all properties together
  $Props = [ordered]@{
      "OS Status" = $OS.Status
      "OS Short Name" = $OS.Caption
      "BIOS Manufacturer" = $BIOS.Manufacturer
      "BIOS Version" = $BIOS.Version
      "Processor Name" = $PROC.Name
      "Processer Core Count" = $PROC.NumberOfCores
    }

    # Create and output
    $CRO = New-Object PSObject -Property $Props # Add table values as property to object.
    $Today = (Get-Date -UFormat %Y-%m-%d).ToString() #Get date and convert to string.
    $SystemReport = ( $name  + '_' + $Today  + '_CurrentState4Test.csv') # Create a path/filename for report.
    $CRO | Export-Csv -Path "$SystemReport" #output to CSV file.
}




