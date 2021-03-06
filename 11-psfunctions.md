# PowerShell Functions

Functions are reusable pieces of PowerShell code. The major advantage of storing PowerShell code in functions over .ps1 scripts is that they can be called in PowerShell from any location in your file structure without entering a path to file. In this section we are going to take a short look at functions - how to create them, how to use them and how to persist them for reuse.

There is much more information about functions online and you should definitely take a look at the Microsoft documentation -

* [Basic function documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-6)
* [Advanced function documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced?view=powershell-6)

It is also possible to enter functions at the command prompt, but these functions cannot be used again after you close your PowerShell session. For functions to persist, you must create a PowerShell Profile.

## Persisting functions

You can persist your self-written functions across all Powershell sessions by adding these functions or loading them into your Powershell profile. Profiles are described in "Configure your PowerShell environment". 

You can also create a Powershell module and install the module on your system. Modules are persisted across PS-sessions.

**Achtung:** If you don't want to persist functions to call them directly from the command prompt, you can dot-source functions to call them from .ps1 scripts. An example of how this is done is here - [https://stackoverflow.com/questions/18764312/loading-custom-functions-in-powershell](https://stackoverflow.com/questions/18764312/loading-custom-functions-in-powershell)

## Create a PowerShell Profile

So let's create a PowerShell profile - to do this type or copy the following in the PowerShell console -

`if (!(Test-Path -Path $profile))            
{New-Item -ItemType File -Path $profile -Force}`

Now you have a PowerShell profile for "Current User / Current Host". With a profile you're ready to write your first function.

## Writing a function

You already wrote some code as a script file in the last chapter. Let's just turn this code into a function. You can make needed changes later. To do this open up your profile by entering`notepad $profile` and create a function \(we'll call it "Get-HostReport".\). Paste the code from the FinalInputs\_ComputerData.ps1 script including the documentation into the function:

`function Get-HostReport            
{            
( Paste Code Here including documentation )      
}`

You now have a working PowerShell function that you can call from all Powershell sessions from the PowerShell command line.

## Running your function from command prompt

Now, let's try to run the function. In PowerShell, Change your drive to a completely different drive than your C drive - it can even be a mapped network drive. Run the cmdlet from the prompt with the "-Path" parameter: Here you need to put the path to the MyComputerNames.txt file. It should look something like:

`Get-HostReport -Path C:\Users\speightss\Source\PS\MyComputerNames.txt`

Now you can run this code from anywhere, also on remote computers, if you have put the function in the correct PowerShell profile. There are still some problems in your script that you have to solve.

* The report is always written to "working directory". Probably you want to save this to a dedicated folder. 
* If you enter the function without the "-Path" parameter, it doesn't work because the  hardcoded fallback path in your function is also based on the file structure of the folder where you saved your scripts \(It assumes the your calling from the working directory.\).

You can fix both by changing the path in the code to an absolute path. Who knows, maybe you don't need this handling logic. Maybe you want to [make "-Path" a required parameter](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-6#static-parameters) or [add a default value as a fallback](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters_default_values?view=powershell-6) or add a file output path as a second parameter.

Calling documentation works just like with your script in the last chapter and you can look at your function help by entering -

`Get-Help Get-HostReport`

Hopefully, you remembered to change your examples because you are no longer calling a script.

**Achtung:** If you just tried running this from a different environment like in your IDE and it didn't work, your profile probably doesn't have the right scope, and you may want to take a look where you saved the "profile.ps1" script. Try moving it the "Current User / All Hosts" folder or creating.

## Running a function - more choices

It is not only possible to run your function at the command line you can also call it from scripts and add it to modules. We just ran the function from the command line but we can embed the function in a script to call it from there. Let's try.

Go to any directory on your computer and create a PowerShell script called `FunctionTest.ps1`. In `FunctionTest.ps1`, add the cmdlet you just typed at your command prompt with a few small changes - `Get-HostReport -Path "C:\Users\speightss\Source\PS\MyComputerNames.txt"`

Now, run the script.

`.\FunctionTest.ps1`

The script should run and give you the same result as before.

Additionally, you can also embed functions in PowerShell Modules. When you do this you can share your functions with other people but keep in mind that if you are going to share your code, it should be usable and that you must maintain both the code and the documentation.

## Section targets

* Understand functions and how they can be used
* Understand the primary concepts and PS-features to support functions
* Create a PowerShell profile
* Understand how to write a functions and where you can run them. 

## That's all folks

That's it for the beginners guide. now you can get information about the computers your are managing, write them to a report and use the report to check and see which kind of software you can install on these computers. If you plan to automate this process, you might want to also create a another script to delete all reports to make way for new reports in the before scheduled run. Or, you might not want to mess around with files at all and include the checking logic in this script \(or pass objects to another scripts\). There are lots of options.

The final section in this booklet is a list of all resources that we could think of to help you go further with PowerShell scripting. Certainly if you are looking for some more practices to become more sophisticated with scripting the [PoshCode StyleGuide](https://poshcode.gitbooks.io/powershell-practice-and-style/content/) is a good place to keep going.

There is a lot more you can learn but hopefully this helped to get started!

