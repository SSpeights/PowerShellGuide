# Scripting cmdlets

One way to look at a powershell script is to see it as a grouping of cmdlets that run sequentially. A script can be much more elaborate than just a set of commands but, like this book, a set of cmdlets is the basis for creating a powershell script.

Our scenario here is that you need to create a report about the computers you manage and you need to gather information about the Desktop, the BIOS, and the Processor on a scheduled basis. Maybe you need to check and see if the computer has a desired state before you perform some action.

It is a good idea to create a directory for this your project. Example scripts are available from GitHub at : [https://github.com/SSpeights/PowerShellGuide.git](https://github.com/SSpeights/PowerShellGuide.git)

## Create a .ps1 file

Create a .ps1 file with a name like ComputerData.ps1. This is where the commands go.

## Create and grab your history

If you created a get-history command list as described in chapter 5, you can open that up. Hopefully, you experimented long enough to create a series of commands that fit "get data \| process data \| output data" - maybe event a couple iterations of this pattern that outputs something useful for you.

To get this information for your local computer you can type the following commands at the PS-prompt:

* Get-WmiObject -Class Win32\_OperatingSystem -ComputerName . \| Select-Object -Property \[a-z\]\*
* Get-WmiObject -Class Win32\_BIOS -ComputerName . \| Select-Object -Property \[a-z\]\*
* Get-WmiObject -Class Win32\_Processor -ComputerName . \| Select-Object -Property \[a-z\]\*

These cmdlets get all of the OS, BIOS, and Processor information for this computer and sorts each property value in ascending order.

To get a list of these cmdlets, enter `Get-History` at the PS-prompt. Copy the output.

## Add cmdlets

Paste the cmdlets into your .ps1 script. Go to the PS-prompt and type in .\ComputerData.ps1. The script runs and the three reports output to the PowerShell console as stdout. Don't forget to document \( a little \) what you plan to do.

**Achtung:** You don't need to type the whole thing if your script name is somewhat unique you just have to type the first letters of the script name and then the TAB key to autocomplete. You don't even have to type ".\". Autocomplete will recognize that this is a PS-script and add this in front of the file name.

Voila. You just made a powershell script file. You can now run the script on demand or schedule this in task manager, cron job or whatever other cron manager you are using. But, we are not done with this script yet because we can make it better.

## Section targets

* Use Get-History to capture commands
* Create a script with these commands
* Run the script



