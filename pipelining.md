# The Pipeline

The pipeline is one of the features that makes PowerShell such a powerful tool. If you have worked with Linux you probably already know how pipe works. Piping enables stringing commands together - using the pipe "\|" symbol - to pass the result of a command to the next command. Piping objects is the most powerful feature of PowerShell. It is important to note that we are only going to treat the "\|" way to pipe objects in this section, but there are other ways to pipeline that produce different results. Liks to more information are in "Further pipeline reading" at the end of this section.

## Basic processing in the pipeline

The difference between PS piping and Linux Shell piping is, that the PowerShell is passing the result of a command as a .NET object and not as text, providing you more ways to use this returned result. That's not important right now. What's important is that you can chain single commands to implement the "Get \| Process \| Output" pipeline, which is a common powershell output where three things happen.

* You get some data that you need
* You process that data and "do" something with it.
* You output the results of your processing

And you can repeat this pattern mutiple times, using the output of the previous pipeline a the "Get" data for the next one, enabling real power from the command line!

Example: Using the pipeline you get all the PS-Verbs, you filter the verbs - only showing the verbs in the security goup, and you output those groups to a file.

`get-verb | where-object {$_.Group -eq "Security"} | Out-file Security-Verbs.txt`

## Controlling your pipeline

In the example above the following happens

* Get-verb fetches all PowerShell cmdlet verbs
* The result of get-verb cmdlet is piped to the where-object cmdlet. 
* Where-object filters for all of the verbs that are found in the  "Security" group, selects only these verbs
* Where-object result is piped, as an object, to the out-file cmdlet
* Out file cmdlet outputs this result to the "Securty-Verbs.txt" file

The pipeline enables fine control of the get, process, output pattern by passing objects that allow the next object to process this output. Cmdlets that allow for filtering for conditionals or for looping through output are:

* Where-Object
* Foreach-Object

### Where-Object {...}

Where-Object enables you to create a conditianal statement \(like an "if" statement\) to filter the output being piped to the where-object cmdlet. The filter itself is enclosed in {}. So if we take a look at the where object part of the example above -  `where-object {$_.Group -eq "Security"}`- we see that.

* "$\_" stands for "this.object" - the result being piped into where object
* .Group is the property being filtered \(you can look at the properties and methods with `get-verb | get-member`\)
* "-eq" is the comparison operator for "==" 
* "Security" is the value you are looking for

**Achtung**: Important to remember is that by using where-object {...} - you select objects from a collection returned by the previous cmdlet that can be piped to the next cmdlet.By filtering objects with where-object, you can also reduce the amount of processing needed by reducing the number objects you return only objects you need to process.

### Select-Object

Seelect-Object is different from Where-Object because it enable you to create brand new objects based on the filter you set. In essence, it has the function of making objects in your pipeline event skinnier by selecting only the properties and creating brand new objects, containing only the data that you need to have, which then speeds up processing further down the pipeline.

[Online information for Select-Object is here.](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Select-Object?view=powershell-5.1) Remember though, you can also get help from the PS-console with `help select-object.`

### Foreach-Object {...} TODO

Controlling formats

looping - foreach statement

It is also possible to designate "which" streams receive pipeline output. Different streams like debugging, error and so on.

### Making comparsions in PS

Microsoft has extensive documentation on using operators, [how to make comparisons and how to filter objects to make them more efficient, and you should take a look at this documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-5.1). For practical purposes though, you can use the following comparison operators to filter your PS objects:

| Purpose | **Operator** | **Example** |
| :--- | :--- | :--- |
| Greater than | -gt | 1 -gt 2 \(Returns $false\) |
| Less than | -lt | 1 -lt 2 \(Returns $true\) |
| Equals | -eq | 2 -eq 1+1 \(Returns $true\) |
| Not equals | -ne | 3 -ne 1+1 \(Returns $true\) |
| Greater than or equal to | -ge | 3 -ge 1+1 \(Returns $true\) |
| Less than or equal to | -le | 2 -le 1+1 \(Returns $true\) |
| Substring search | -match |  |
| Wildcard searches | -like |  |
| Array content search - includes | -in |  |
| Array content search - does not include | -notin |  |
| Array content search - includes | -contains |  |
| Array content search - does not include | -notcontains |  |

[Microsoft's documentation for PS-comparison operators is here.](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-5.1)

Syntax for multiple pipeline conditions looks like -

`get-verb | where-object {$_.Group -eq "Security" -or $_.Group -eq "Communications"}`

`get-service |` `where-object {$_.ServiceName -like "net*" -and $_.Status -eq "running" }`

`Get-ChildItem | Where-Object {$_.Length -gt 41 -and $_.Name -like "*.exe"}`

[Microsoft's documentation for logical operators is here.](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-5.1)

And of course, you can always take a look at the example help for where-object cmdlet, here there are also examples for how to filter for multiple syntaxes. Just type`help where-object -example`.

## When not to output to the pipeline

stdout messaging for routine

## Further pipeline reading

Microsoft has good docuementation for powershell and we recommend that you also [take a look at their documentaiton about pipelines](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-5.1) to get more details on how to use the pipeline and alternative ways to pipeline objects for your PowerShell tasks.

## Some basic uses cases for the pipe

### **Send output to stdout as a formatted list**

```
Get-Process | Out-Host -Paging | Format-List
```

### **Page content**

`Get-Command | more`

### Output** to file**

`Get-Process | Out-File -FilePath C:\temp\processlist.txt`

## Section Targets

* Using pipelines to execute the get data \| process data \| output result pattern
* Filter collections of objects with the pipeline with Where-Object
* Create skinnier objects with Select-Object
* Individually process objects with Foreach-Object 
* Learning some useful examples for important use cases



