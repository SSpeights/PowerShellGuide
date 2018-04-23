# PowerShell Functions

Functions are reusable pieces of PowerShell code. The major advantage of storing PowerShell code in functions over .ps1 scripts is that they can be called in PowerShell from any location in your file structure without entering a path to file. In this section we are going to take a short look at functions - how to create them, how to use them and how to persist them for reuse

There is much more information about functions online and you should definitely take a look at the Microsoft documentation -

* [Basic function documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-6)
* [Advanced function documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced?view=powershell-6)

It is also possible to enter functions at the command prompt, but these functions cannot be used after you close your PowerShell session. For you functions to persist you must create a PowerShell Profile.

## PowerShell Profile

PowerShell Profile is a script that allows you to configure your Powershell environments with custom configurations that persist for every PowerShell session. The Profile script runs at session-start and you can configure commands, aliases, variables, modules and, yes, functions in this file that you want to be able to access from PowerShell. For an in-depth look at PowerShell Profiles, [take a look at the Microsoft reference documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-6). Pay special attention the different profile scopes. The different scopes are:

| Description | Reference | Path |
| :--- | :--- | :--- |
| Current user, Current Host | $profile | $Home\\[My \]Documents\WindowsPowerShell\Profile.ps1 |
| Current User, All Hosts | $profile.CurrentUserAllHosts | $Home\\[My \]Documents\Profile.ps1 |
| All Users, Current Host | $profile.AllUsersCurrentHost | $PsHome\Microsoft.PowerShell\_profile.ps1 |
| All Users, All Hosts | $profile.AllUsersAllHosts | $PsHome\Profile.ps1 |

**Achtung: **Your PowerShell Profile can be set for different scopes and you will want to understand what these are. Take a look at the four different profiles in the online documentation.

## Create a PowerShell Profile

So let's create a PowerShell profile - to do this type or copy the following in the PowerShell console -

`if (!(Test-Path -Path $profile))`

`{New-Item -ItemType File -Path $profile -Force}`

Now you have a PowerShell profile for "Current User / Current Host".

## Writing a function

You already wrote some code in the form of a script file in the last chapter. Let's just turn it into a function. You can make needed changes later. To do this open up your profile by entering`notepad $profile` and create a function \(we'll call it "Get-HostReport".\). Paste the code from the FinalInputs\_ComputerData.ps1 script into the function:

> `function Get-HostReport`
>
> `{`
>
> `<Paste Code Here including documentation>`
>
> `}`

## Running your function from command prompt

Now, let's try to run the script. Change your drive to a completely different drive than your C: drive - it can even be a mapped network drive. Run the cmdlet from the prompt with the -Path parameter: Here you need to put the path to the MyComputerNames.txt file. It should look something like:

`Get-HostReport -Path C:\Users\speightss\Source\PS\MyComputerNames.txt`

Now you can run this code from anywhere, also on remote computers if you have put the function in the correct PowerShell profile. There are still some problems in your script that you have to solve.

* The report is always written to "working directory". Probably you want to save this to a dedicated folder. 
* If you enter the function without the "-Path" parameter, it doesn't work because the  hardcoded fallback path in your function is also based on the file structure of the folder where you saved your scripts \(It assumes the your calling from the working directory.\).

You can fix both by changing the path in the code to an absolute path. Who knows, maybe you don't need this handling logic. Maybe you want to make "-Path" a required parameter or add a default value as a fallback or add a file output path as a second parameter.

Documenting works just like with your script in the last chapter and you can look at your function help by entering

`Get-Help Get-HostReport`

**Achtung:** If you just tried running this from a different environment like in your IDE and it didn't work, your profile probably doesn't have the right scope, and you may want to take a look where you saved the "profile.ps1" script. Try moving it the "Current User / All Hosts" folder or creating

## Running a function - more choices

It is not only possible to run your function at the command line you can also call it from scripts and add it to modules. We just ran the function from the command line but we can embed the function in a script to call it from there. Let's try.

Go to any directory on your computer and create a PowerShell script called `FunctionTest.ps1`. In `FunctionTest.ps1`, add the cmdlet you just typed at your command prompt with a few small changes - `Get-HostReport -Path "C:\Users\speightss\Source\PS\MyComputerNames.txt"`

Run the script. The script should run and give you the same result as before.

Additionally, you can also embed functions in PowerShell Modules. When you do this you can share your functions with other people who can benefit from the code that you have written but keep in mind that if you are going to share your code should be usable and that you must maintain it both the code and the documentation.

## Section targets

* Understand functions and how they can be used
* Understand the primary concepts and PS-features to support functions
* Create a PowerShell profile
* Understand how to write a functions and where you can run them. 

## That's all folks

That's it for the beginners guide. now you can get information about the computers your are managing, write them to a report and use the report to check and see which kind of software you can install on these computers. If you plan to automate this process, you might want to also create a another script to delete all reports to make way for new reports in the next scheduled run. Or, you might not want to mess around with files at all and but the checking logic in this script \(or pass objects to another scripts\). There are lots of options.

The final section in this booklet is a list of all resources that we could think of to help you go further with PowerShell scripting. There is certainly a lot more you can do but hopefully this helped to get started!

## 



