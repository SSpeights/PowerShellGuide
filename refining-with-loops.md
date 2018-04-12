# Refining your script

**Achtung**: documentation for what's going on in code is in the code example on github feel free to download from the examples and use them for other scripts.

After running the script you realize that you don't need all of this information and that you can't really see where the reports begin and end. The only information you need to run your check is:

* OS Status
* OS Name and version
* BIOS Manufacturer
* BIOS Version
* Processor Name
* Number of Cores on your machine.

## Separating reports

First though we have to find this information and since you want to find out which properties you need you decide to split up the reports in stdout with the PowerShell "echo" command - Write-Host. Remember Write-Host doesn't write to the pipeline so for things like data labels or information for folks running the script, this is a good choice.

So add, Write-Host statements underneath each report to separate them.

Example: `Write-Host "OS report finished" -ForegroundColor Red -BackgroundColor White`

## Adding Variables

You might want to use this script for something else and to get data for multiple computers besides this one report. Variables can save lines of code and you decide to add a variable for the different computer data reports you want to generate and also for the names of different systems you manage that you want to check. So you add these variables, some "foreach" loops and a little condition just in case the string array for the computer name is empty.

## Adding a Parameter

After thinking about it a little bit, it doesn't make sense to enter a your systems in the script because powershell can read them in from a file very easily. This has the added advantage that you can read different lists of systems into your script. So, you change your ComputerName variable to a String array parameter that can be read into the script by adding a parameter to the command line. parameter is optional and you can also add computer names via the "if" statement in the script

## Creating a Custom Object and Outputting to file

So the script is now pretty elegant and compact but it still is producing too much data. You only need the six information pieces above. You decide using variables in your commands is not the right way to build this script.

Here you take away the variable and loop for ComputerInfo, select only the information you need, add this to a new object and, finally, output to a csv file that you can use for your checking logic script.

That's it. now you can get information about the computers your are managing, write them to a report and use the report to check and see which kind of software you can install on these computers. If you plan to automate this process, you might want to also create a another script to delete all reports to make way for new reports in the next scheduled run. Or, you might not want to mess around with files at all and but the checking logic in this script \(or pass objects to another scripts\). There are lots of options.

The final section in this booklet is a list of all resources that we could think of to help you go further with PowerShell scripting. There is certainly a lot more you can do but hopefully this helped to get started!

