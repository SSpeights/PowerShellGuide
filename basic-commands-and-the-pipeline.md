# Your cmdlet list

Once you have discovered cmdlets that can help you, it is a good idea to build up a repository of commands that you can always access and reuse. This makes it easier to reuse commands and even build scripts. After a while you may not need these lists of commands, but at first, it is a good way to experiment and once you find something that works, you can create a list and add it to a script.

## Get-History

Get history retreives the commands that you entered at the PS-prompt for the current session. This is a great way to get a list of commands by outputting them to a file. You can use the list to seed a Powershell script or save a command repository that you can use. After a useful sequence of powershell commands type `get-history` and the commands you typed in the current session will be output as a numbered list in the console. `get-history | out-file history.csv` outputs to a csv file in the working directory.

You can also retrieve past sessions, if you absolutely need to.

## Start-Transcript

If you want to save all the commands and their output to use later, enter the `Start-Transcript` command  saves all commands and all output and saves it to a text file. You must type this at the beginning of a session. You can stop a transcript at any time with `stop-transcript`.

## Cool cmdlets

The best way to get to know which cmdlets are best for your use cases is to practice. Microsoft provides a good [cookbook for different kinds of cmdlets here](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/basic-cookbooks?view=powershell-5.1). Go through these to get a feel for which ones are the most useful and output your Powershell session history to get a list of useful commands.

## Section Targets

* Record a list of cmdlets for reuse 
* Record eveything that happens in the entire PS-session to reuse cmdlets and results
* Be able to find and start using the Microsoft Cookbook for PS development



