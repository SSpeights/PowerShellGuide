# Scripting basics in PowerShell

Very simply, the reason why you want to learn how to create Powershell scripts is because a script can be automated. Even if you only save 5 minutes by automating a task, if you have to perform that task 5 times a day - you still save 25 minutes. These savings add up.

PowerShell scripts have the .ps1 extension. If you have already selected an IDE for your scripting, you can go ahead and open it. Create a .ps1 script and name it "Hello.ps1"

in the script add - `write-output "Hello"`.

## PS Execution Policy

**Achtung**: if you get an "unauthorized access warning" in red text and your script doesn't run. It means that you need to change your Execution policy so you can execute PS scripts on your system. You do this with the `Set-ExecutionPolicy` comand. To get the information you need to do this, [please visit this Microsoft technet page](https://technet.microsoft.com/en-us/library/ee176961.aspx). You must have an overview of the different Execution-Policies before you set a policy and talk to ICT first. Setting the policy to "unrestricted" might not be the best choice...

To run the script go down to the console bash and type in .\Hello.ps1

**Another Example:** You persist PS-cmdlets in .ps1 files.

Before I forget you can pipeline, directly into a PowerShell script. Try this. Create a .ps1 file with this code

`foreach ($i in $input) {`

`$i`

`}`

and from the PS-bash type - 1..20 \| .\&lt;FileName&gt;.ps1. The script should print numbers 1 - 20 to stdout - one number per line.

## Syntax basics

Just like a shell script in Linux, you must type in a ".\" to run the script. In this script, we just added a command, unlike the typing in write-output at the command line you can schedule this script to run whenever and as often as you like. Here are some of the basics you need to know about scripting -

| PowerShell Script Basic Property | Value | Description |
| :--- | :--- | :--- |
| PS Script file extension | .ps1 | Use this extension to enable Windows to recognize that this is powershell. |
| Run a PS script | .\&lt;ScriptName.ext&gt; | From the PS-prompt use this sytax to tell PowerShell to run a script |
| PS Script variable character | $ | To declare a variable prefix the variable name with a "$" |
| PS Script escape character | \` | for speicial characters in a string use the "\`" to escape them. Example: "three\`$Horse". Escaped the "$" to character. Normall this means "var". |
| PS Script pipeline character | \| | Pass the result of cmdlet 1 to the next cmdlet 2 and so on. Results are piped as objects. |
| PS Script member enumeration | \(command -parameters\).property | This technique is used to retrieve single properties of a object result and |
| PS Script optional arguments | \[\] |  |
| PS Block Statement | {} | Used in cmdlets and in scripts Block statements can be seen as query filters |
| PS Script comment | \# | document your scripts... |

## Variables in scripting

## Parameters in scripting



## Section Targets

* Learn how to enable running scripts
* Learn the usage for PS operators and operands
* Write some PS-Scripts
* Write some more advanced scripts using variables, escaping special characters, retrieving individual properties



