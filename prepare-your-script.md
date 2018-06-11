# Document Before Coding \(a little\)

No. you don't have to do like this if you don't want to. But, scripts are code just like in C\#, Java, Ruby, Python, etc and it is good when other people can understand what a script is for - maybe they can use it too. Also, if you take the time to elaborate the tasks that your script should perform, i.e. if you think about if first and make a plan, you'll probably write a better script. Not only will other folks understand your script better - you will too. This is a good way to plan your script, especially if you're are just getting started with PS.

## Create a template

In this case the template is already created for you. [Our template example is here](/Examples/Template/BaseTemplate.ps1). Snag it, add it to the "templates" folder in your PS-project, and open it in your favorite PS-IDE.

## Create help - part 1

Amazon starts their feature development with a press release. This is their way for "working back from the objective". With a PowerShell script it makes sense to start **by creating a description of what your script should do**.

PowerShell supports adding help documentation directly to the your script. You can then call the help directly from the command line, just like for all the standard cmdlets and scripts in the PS-gallery. You want to do this because if you have to go away from your script for a long time, you will need this documentation to refresh your memory when you come back.

To create CLI help you must have this section in your script.

`<#`

`.Synopsis`

`Add a short description of your script`

`.DESCRIPTION`

`Add a longer description of your script`

`.EXAMPLE`

`Example of how to use this cmdlet`

`.EXAMPLE`

`Another example of how to use this cmdlet. Add as many examples as possible!`

`#>`

The good news is that the help section is already included in the template. You can add the following information to the help section.

| Help node | Description |
| :--- | :--- |
| .SYNOPSIS | Short description of what your script does. |
| .DESCRIPTION | Long description of what your script does. |
| .PARAMETER &lt;Parameter&gt; | Document the parameters in your script. |
| .EXAMPLE | Usage examples for your script one .EXAMPLE node per example. To only see examples, use the "-example" switch. |
| .INPUTS | Describes what can be piped into this script. |
| .OUTPUTS | Describes what this script returns. |
| .NOTES | Special notes for your script like contact information. .NOTES is only displayed when the "-full" switch is used. |
| .LINK | Link to online help or other online resource. You can go directly to the online resource with the get-help "-online" switch. |

To see what we mean, go to the template folder in the PowerShell console and enter -  get-help .\BaseTemplate.ps1. You should see the help information displayed in the console. These are the basics but there are more and, [the full list can be found here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1&viewFallbackFrom=powershell-Microsoft.PowerShell.Core). Additionally, you can also use an XML syntax to create help documentation.

**Achtung:** In general, you don't want to add a date unless you have to deliver this script to someone outside the company. In addition to an IDE, it is assumed that you are also using version control - Git or something else. Let your version control do the datetime-stamping for creation date and updates.

## Write out your tasks

The "main" PS-Script is procedural, holds all of the routines in your script together and, in most cases, sequences them. For each routine in your script, you can have a task comment - \#Task1 - \#TaskX in the template. Here you write what each routine performs and maybe what it returns and passes to the next routine... Remember the basic pattern is Get data \| Process Data \| Output result.

Add variables and parameters as needed.

## Code / Test / Code more

Now you script, testing it and scripting some more as needed. In this part you add any needed variable and parameter to your script. This is also where I would spike and stabilize. If I write something good then I would stabilize by refactoring hacked code into nice structures like variables, parameters, objects and so on. You can add your variables and parameters to the "\#Variable" section and the "\#Parameter" section, if you like.

## Comment your script

As needed, comment the important parts of your script, you want to be able understand what you wrote two months from now.

## Create help - part 2

When you are done add the rest of the help that you think is important for using you script: especially polishing up your DESCRIPTION and adding EXAMPLES.

## Section targets

* Learn how to create help documentation for your script
* Learn what goes into a script template
* Get the script template
* Review good script planning procedure
* Review good script documentaiton procedure



