# Powershell Framework

Understanding a little bit about how PowerShell works goes a long way to helping you find the PS-Resources your need and code PS more efficiently and comfortably. You should now have an integrated development environment and you can use the IDE to take a look at how Powershell is semantically structured and get and how PowerShell helps you to code faster.

## Powershell command structure

Powershell cmdlets have a VERB-NOUN structure and are generally case insensitive. There are other aspects of cmdlets that you need to note. These are:

* [Powershell Verbs](https://www.gitbook.com/book/sspeights/haufe-group-beginning-powershell-guide/edit#)
* [Aliases](https://msdn.microsoft.com/en-us/library/dd878329%28v=vs.85%29.aspx)
* [Positional Parameters \(but also named parameters\)](https://msdn.microsoft.com/en-us/library/dd878252%28v=vs.85%29.aspx)

Achtung: We are providing links to web pages here but encourage you to use the Powershell console. To get a list of PS-verbs,open PowerShell and type `get-verb`.

### Aliases

The Verb-Noun pattern is good to get started and helps with intuitive discovery of cmdlets - so you can find and use fast. Once you get to know the cmdlets, you can use the alias to script cmdlets more quickly. For example, `get-command` cmdlet alias is `gcm`. You can get the complete list of PS-aliases by type `get-alias` or its alias, `gal`, in the PS-console.

Command alias is also included in the help of individual commands. By typing `help get-command`, you can see the alias "gcm" in the get-command help page.

### Positional Parameters

Also very cool are positional parameters. To set the parameter you only have to add the value of the parmeter in the correct location. You can omit the name.

### Powershell Verbs

While command nouns are configurable, verbs are not. Verbs are curated by Microsoft, and you can find the official list by clicking the link in the list above. Even better though, you can get a list of verbs by typing `get-verb` from the command prompt in the PS-Console

**Verbs are grouped logically,** and it is a good idea get acquainted with, which verbs belong to which groups. Knowing verb grouping helps you to search more intuitively for cmdlets. You can also filter verbs by group. Example: To print all verbse that belong to the "Security" group you type`get-verb | where-object {$_.Group -eq "Security"}`.

You persist PS-cmdlet in .ps1 files.

Before I forget you can pipeline, directly into a PowerShell script. Try this. Create a .ps1 file with this code

`foreach ($i in $input) {`

`$i`

`}`

and from the PS-bash type - 1..20 \| .\&lt;FileName&gt;.ps1. The script should print numbers 1 - 20 to stdout - one number per line.

### Functionality - the big picture

### Feature discovery

## Section targets

* Know how to find great PS-resource online
* Understand cmdlet structure and know features that allow to code cmdlets more comfortably
* Understand the pipeline
* Understand scripts and their purpose



