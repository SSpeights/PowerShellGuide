# Powershell Framework

Understanding a little bit about how PowerShell works goes a long way to helping you find the PS-Resources your need and code PS more efficiently and comfortably. You should now have an integrated development environment and you can use the IDE to take a look at how Powershell is semantically structured and get and how PowerShell helps you to code faster.

## Powershell command structure

Powershell cmdlets have a VERB-NOUN structure and are generally case insensitive. There are other aspects of cmdlets that you need to note. These are:

* [Powershell Verbs](https://www.gitbook.com/book/sspeights/haufe-group-beginning-powershell-guide/edit#)
* Powershell Nouns
* [Aliases](https://msdn.microsoft.com/en-us/library/dd878329%28v=vs.85%29.aspx)



Achtung: We are providing links to web pages here but encourage you to use the Powershell console. To get a list of PS-verbs,open PowerShell and type `get-verb`.

## Powershell Verbs

While command nouns are configurable, verbs are not. Verbs are curated by Microsoft, and you can find the official list by clicking the link in the list above. Even better though, you can get a list of verbs by typing `get-verb` from the command prompt in the PS-Console

**Verbs are grouped logically,** and it is a good idea get acquainted with, which verbs belong to which groups. Knowing verb grouping helps you to search more intuitively for cmdlets. You can also filter verbs by group. Example: To print all verbse that belong to the "Security" group you type`get-verb | where-object {$_.Group -eq "Security"}`.

## Powershell Nouns

Nouns can vary based on what the PS cmdlet is supposed to do. It is even possible to create your own cmdlets and Powershell modules that access various services. So if you leverage the APIs of powershell and another service to create something new the noun part of your powershell cmdlet would be completely unique like - `Get-NewlyIntegratedService.`

**Achtung:** When you search for Powershell cmdlets or scripts you can use verbs or nouns or both 

## Aliases

The Verb-Noun pattern is good to get started and helps with intuitive discovery of cmdlets - so you can find and use fast. Once you get to know the cmdlets, you can use the alias to script cmdlets more quickly. For example, `get-command` cmdlet alias is `gcm`. You can get the complete list of PS-aliases by type `get-alias` or its alias, `gal`, in the PS-console.

Command alias is also included in the help of individual commands. By typing `help get-command`, you can see the alias "gcm" in the get-command help page.

### Autocomplete





### Functionality - the big picture

### Feature discovery

## Section targets

* Know how to find great PS-resource online
* Understand cmdlet structure and know features that allow to code cmdlets more comfortably
* Understand the pipeline
* Understand scripts and their purpose



