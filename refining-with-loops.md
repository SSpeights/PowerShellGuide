# Refining Your Script

**Achtung**: documentation for what's going on in code is in the code examples. Feel free to [download the examples from GitHub](https://github.com/SSpeights/PowerShellGuide) and use them for other scripts.

After running the script you realize that you don't need all of this information to validate your computer state and that you can't really see where the reports begin and end. The only data you need to run your check is:

* OS Status
* OS Name and version
* BIOS Manufacturer
* BIOS Version
* Processor Name
* Number of Cores on your machine.

You decide to deal with this part last because first you have to find out the property names for this data.

## Separating reports

Since you have to find this information, you decide to split up the reports in stdout with the PowerShell "echo" command - Write-Host. Remember Write-Host doesn't write to the pipeline so for things like data labels or information for folks running the script, this is a good choice.

So you add, Write-Host statements underneath each report to separate them.

Example: `Write-Host "OS report finished" -ForegroundColor Red -BackgroundColor White`

[Here's what this looks like in your script.](/Examples/SplitReports-ComputerIData.ps1)

## Adding Variables

You decide you want to use this script To check different data and to get data for multiple computers besides this one report.

Variables can save lines of code and you decide to add a variable for the different computer data reports you want to generate and also for the names of different systems you manage that you want to check.

[So you add these variables, some "foreach" loops and a little condition just in case the string array for the computer name is empty.](/Examples/AddVariable_ComputerData.ps1)

## Adding a Parameter

After thinking about it a little bit, it doesn't make sense to enter a your systems in the script because powershell can read them in from a file very easily. This has the added advantage that you can read different lists of systems into your script. So, you change your ComputerName variable to a String array parameter that can be read into the script by adding a parameter to the command line.

[The parameter is optional and you can also add computer names via the "if" statement in the script, if there is no input file.](/Examples/AddParameter1_ComputerInformation.ps1)

## Creating a Custom Object and Outputting to file

So the script is now pretty elegant and compact but it still produces too much data. You only need the six pieces of information . You decide using variables in your commands is not the right way to build this script.

Here you take away the variable and loop for ComputerInfo, select only the information you need, add this to a new object and, finally, output to a csv file that you can use for your checking logic script. [The script now looks like this.](/Examples/CreateObject-OutputToFile_ComputerData.ps1)

## Making it easier to read in data

As a final step, you decide to make entering the parameter easier so you only have to enter a file name\(s\) instead of "Get-Content" at the command line. You also decide to that you want to be able to set the list of system names from inside the script for automation purposes.

You also add a little fallback statement if the file is empty - just in case. And, you add an error handling, if the status isn't "OK" no file will be written and you get a message telling you that you need to troubleshoot system name, network connection or the system itself.

[Your final script is here](/Examples/FinalInputs_ComputerData.ps1). You also have full help for this script from the CLI. Simply type in`help .\FinalInputs_ComputerData.ps1`.

## Validating your script

Maybe your script works but there are still some improvements you can make. One tool that enables you to validate and write better scripts is the [Powershell module PSScriptAnalyzer ](https://www.powershellgallery.com/packages/PSScriptAnalyzer/).

We don't go into modules in this guide, but installing and using the analyzer is relatively straightforward. And by using the `Invoke-ScriptAnalyzer` cmdlet, you can validate the errors and find how this script can still be better \(Although you can ignore the "Write-Host" warning, since "Write-Host" now wraps "Write-Information"\).

## Section targets

* Refine your script based on your problems and targets.
* Learn to use variables, parameters and loops in your script.
* Learn how to validate your script with the PSScriptAnalyzer module.



