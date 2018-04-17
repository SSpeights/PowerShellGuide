<#
.SYNOPSIS
   Here we get data about the computers we are managing and create a report to test something

.DESCRIPTION
   Here we get data about the computers we are managing and create a report to test something
   We want to check
   - operating system information
   - BIOS information
   - Processor information

.PARAMETER Path
    List of system names (Array of String). Usually, read in from a file. Retrieve data from these systems.
    If reading from a file and using Get-Content cmdlet, the file must have one system name per line.
    If no parameter is provided, the script falls back to handling logic in the script.

.EXAMPLE
    FinalInputs_ComputerData.ps1 MyComputerNames.txt
    In this example, uses the path parameter to input system names from a text file


.EXAMPLE
    FinalInputs_ComputerData.ps1
    In this example, the system names are input from inside of the script by setting the system names in the ComputerName string array variable.
    If there is an empty array, the script retrieves local system information.

.INPUTS
    A text file with managed system names. One system name per line.

.OUTPUTS
    OS, BIOS, Processer information about each system as STDOUT and as CSV file.

.NOTES
    #FinalInputs_ComputerData.ps1
    #Speightss
    #Speightss@haufe.com

.LINK
    http://work.haufegroup.io/
#>

#Parameters
#This holds the list of computers read in from the command prompt
param( [string[]]$Path )

$ComputerName = (Get-Content $Path)

if ($ComputerName.Length-eq 0)#handling logic for an empty parameter.
{
$ComputerName = (Get-Content .\MyComputerNames.txt)
}
if ($ComputerName.Length-eq 0) #handling logic for an empty array

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
    If ($OS.Status-eq "OK") # if OS is OK write file
    {
        $CRO | Export-Csv -Path "$SystemReport" #output to CSV file.
    }
    else #if not, write message.
    {
        Write-Host ($name + " Check system name. OS status doesn't have a value, you can't connect, or there is something wrong with this system.") -ForegroundColor Red -BackgroundColor White
    }
}

