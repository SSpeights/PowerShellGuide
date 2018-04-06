# Getting savvy with PowerShell

PowerShell feature set is huge, and one of the major tasks, when you decide to use PowerShell, is to figure out which commands you need to get your task done. Once you get started - realize that PowerShell is very big and that leveraging the "Find" resources both in the CLI and on the web will be important to working effectively.

PowerShell has quite a few resources that can help you get up to speed with this technology. There are many cmdlets in PowerShell so it is important to find out what they do and how you can used them. In addition, there is a large Powershell community and you can get help using the normal channels. Major outlets for PowerShell ideas are -

* [Microsoft's PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)
* [PowerShell Communities including StackOverflow](https://docs.microsoft.com/en-us/powershell/#pivot=main&panel=community)
* [The Powershell Gallery](https://www.powershellgallery.com/) - Official repository for PS-Module and PS-Scripts that you can download and use
* [PowerShell Magazine](http://www.powershellmagazine.com/) \(PS-people like Keith Hill post articles here\)

These resources are geared toward finding more tutorials and connecting with people to get answers to questions. But the real star of the resource-show is the PowerShell CLI itself.

## OPP - Other People's Powershell

You won't need it right away but an important resource will be the Powershell Gallery. This is where curated PowerShell Modules and scripts get stored so others in the PS-Community can use them. Currently, there are over 2,500 modules and scripts in the Gallery. Hopefully, it can speed you up by exposing code that performs a function that you must have. I mention this first, but in the this section, this will be addressed last, because we have to learn a little about PowerShell before we go and access other people's code.

## Make sure help is up to date

The easiest way to find out what you can do with PowerShell is to open the PS-console and type `get-help <ps-command>` or just `help <pscommand>.`

Before you do this though, you should be sure that you have all of the help on your machine.

To do this, type `update-help` at the PS command prompt.

**Achtung:** you might want to try this at home, away from the proxy server.

## PowerShell search pattern

When you want to find a specific command, most of the PowerSehll gurus recommend the following steps.

* Use your intuition and knowledge of Microsoft technologies 
* Filter your get-command for plausible command names - so if your looking for IP configuration filter for \*IP\* \(you can also use a verb as a filter!\)
* Scan the results and select the best looking command
* Use "get-help + CommandName" to get detailed help

## Finding useful commands

Let's say you have to keep yourself from working too much - otherwise you would work until midnight every night. To prevent yourself from overworking and experiencing burnout, you decide to automate computer shutdown at 18:00 Monday - Friday. PowerShell is your tool of choice.

You know that "Shutdown" is not an official PowerShell verb, but you don't know what the actual verb is so, you type `get-verb` at the PS-prompt. You get a list of returned PS Verbs. There are a lot of verbs, but you see in the "Lifecycle" verb group there is a verb call stop.

To get more specific you type in a get-command with \*stop\* as the filter: `gcm *stop*` . There are lots of commands so you decide to page the results and you type `gcm *stop* | more`. After scrolling down you see there is a "stop-computer" command.

To see if it's the right one you call the help for this command with: `get-help stop-computer`.  Sure enough, with stop-computer you can shutdown local and remote computers.

This is the "broad to narrow" search way to find commands in PowerShell. If you are just beginning with PowerShell, it is probably a good idea to find at least some of your commands like this. Remember, you may be working on headless servers in the future, and there will be no browser with which to google. But...

**Achtung: Don't forget to google! **If this seems like a lot of work, I also found the "stop-computer" cmdlet by googling with "Powershell command to shut down computer": "stop-computer" was the first result; so in my opinion, googling is also a plausible alternative to discover PS-cmdlets. The good part is that you can enter what you want to do in plain text! Try googling for "Test network connection with PowerShell" and see what you get. Once you find the command though, you may want to move back to the console and use "Get-Help" to get the detailed usage information. It will go faster.

## Exemplary help

Not only does Powershell offer useful help pages from the console, you can also call actual examples, and often, these examples can speed up your scripting.

Let's say you decide to not only save yourself from burnout but also save the company some money, by automating shutdown for your test and production remote systems in the cloud - also at 18:00 every day - and you need a report of the results. To retrieve cmdlet examples, you add an "example" switch to your help cmdlet: `get-help stop-computer -example`.

Examples are displayed in the console. Example number 2 - "Shut down two remote computers and the local computer" fits your use case nicely and so you can copy and add it to a powershell script, make some small modifications and schedule it to run at 18:00.

There are other help switches that are useful and they are:

* `get-help stop-computer -online`-  takes you to the "stop-computer" online help page \(Google may be faster here!\)

* `get-help stop-computer -parameter <Parameter>`- displays help for one parameter of "stop-computer"

* `get-help stop-computer -detail`- displays the help page with detailed documentation for parameters

* `get-help stop-computer -full`- displays everything

## Find out what's inside the PowerShell Object

Once you know which cmdlets you must use, you can discover what these commands output by piping the output to the `Get-Member` command. Remember, Powershell shell always outputs objects and these objects contain methods and properties just like any other objects in the .NET framework. Get-Member is useful because maybe you only need to 1 or 2 pieces of information. With the Get-Member cmdlet you can look at the guts of PS-Objects and decide what you need. This makes your scripting more performant.

In the following example, the output of Get-NetIPConfiguration is piped to Get-Member, which returns the properties

Example: `Get-NetipConfiguration | Get-Member`

## Find-Script / Find-Module

Like other repositories - e.g. Docker Hub, Ruby Gems, NPM - PowerShell has an online repository with curated scripts - the [PowerShell Gallery. ](https://www.powershellgallery.com/)

From the command line, you can explore the Powershell gallery with the `find-module` and `find-script` commands. Downloading, installing, publishing and other actions are also possible and are documented on the PS Gallery web site.

## Section Targets

* Find PS resources online
* Find PS resources from the CLI
* Get the basic cmdlet find pattern for PS CLI
* Know how to find cmdlets you need
* Know how to access the different kinds of PS help
* Know how to look at cmdlet members
* Know how to find scripts and modules from the PS Gallery with the CLI



