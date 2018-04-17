# The Pipeline

The pipeline is one of the features that makes PowerShell such a powerful tool. If you have worked with Linux you probably already know how pipe works. Piping enables stringing commands together - using the pipe "\|" symbol - to pass the result of a command to the next command.

Piping objects is the most powerful feature of PowerShell. It is important to note that we are only going to talk about the "\|" way to pipe objects in this section, but there are other ways to pipeline that produce different results. Links to more information are in "Further pipeline reading" at the end of this section.

## Basic processing in the pipeline

The difference between PS piping and Linux Shell piping is, that the PowerShell is passing the result as a .NET object and not as text, providing you more ways to use this returned result and sparing you the effort of parsing text. That's not important right now. What's important is that you can chain single commands to implement the "Get \| Process \| Output" pattern, where three things happen.

* You get some data that you need
* You process that data and "do" something with it.
* You output the results of your processing

And you can repeat this pattern multiple times at different scales, using the output of the previous pipeline as the "Get" data for the next one, enabling real power from the command line!

Example: Using the pipeline you get all the PS-Verbs, you filter the verbs - only showing the verbs in the security goup, and you output those groups to a file.

`get-verb | where-object {$_.Group -eq "Security"} | Out-file Security-Verbs.txt`

## Controlling your pipeline

In the example above the following happens

* Get-verb fetches all PowerShell cmdlet verbs
* The result of get-verb cmdlet is piped to the where-object cmdlet. 
* Where-object filters for all of the verbs that are found in the  "Security" group, selects only these verbs
* Where-object result is piped, as an object, to the out-file cmdlet
* Out file cmdlet outputs this result to the "Security-Verbs.txt" file

The pipeline enables fine control of the get, process, output pattern by passing objects that allow the next cmdlet to process this output. Cmdlets that allow for filtering for conditionals or for looping through output are:

* Where-Object
* Foreach-Object

### Where-Object {...}

Where-Object enables you to create a conditional statement \(like an "if" statement\) to filter the output being piped to the where-object cmdlet. The filter itself is enclosed in {}. So if we take a look at the where object part of the example above -  `where-object {$_.Group -eq "Security"}`- we see that.

* "$\_" stands for "this.object" - the result being piped into where object
* .Group is the property being filtered \(you can look at the properties and methods with `get-verb | get-member`\)
* "-eq" is the comparison operator for "=" 
* "Security" is the value you are looking for

**Achtung**: Important to remember is that by using where-object {...} - you select objects from a collection returned by the previous cmdlet that can be piped to the next cmdlet. By filtering objects with where-object, you can also reduce the amount of processing needed - i.e. reducing the number objects you return to only the objects you need to process.

### Select-Object

Select-Object is different from Where-Object because it enables you to create brand new objects based on the filter you set. In essence, it has the function of making objects in your pipeline  skinnier by selecting specific properties and creating brand new objects that contain only the data.

[Online information for Select-Object is here](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Select-Object?view=powershell-5.1) or you can type`help select-object`from the PS-console.

### Foreach-Object {...}

The Foreach-Object cmdlet performs processing on each object in a collection of objects. One example for this outlet is changing registry key values:

Example: `Get-ItemProperty -Path HKCU:\Network\* | ForEach-Object {Set-ItemProperty -Path $_.PSPath -Name RemotePath -Value $_.RemotePath.ToUpper();}`

This example converts all values of the registry keys under network with the name RemotePath to uppercase letters.

Before I forget you can pipeline, directly into a PowerShell script. Try this. Create a .ps1 file with this code

`foreach ($i in $input) {`

`$i`

`}`

and from the PS-bash type - `1..20 | .\<FileName>.ps1`. The script should print numbers 1 - 20 to stdout - one number per line.

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
| Substring search | -match | $\_.ServiceName -match "^netlog.\*" \(retreturns NetLogon service\) |
| Wildcard searches | -like | $\_.ServiceName -like "netlog\*" \(Returns NetLogon service\) |
| Array content search - includes | -in | 3 -in \(2,3,4,5\) \(returns true\) |
| Array content search - does not include | -notin | 7 -notin \(2,3,4,5\) \(returns true\) |
| Array content search - includes | -contains | \(2, 3, 4, 5\) -contains 3 \(returns true\) |
| Array content search - does not include | -notcontains | \(2, 3, 4, 5\) -contains 7 \(returns true\) |

There is more and [Microsoft's documentation for PS-comparison operators is here.](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-5.1)

Syntax for multiple pipeline conditions looks like -

`get-verb | where-object {$_.Group -eq "Security" -or $_.Group -eq "Communications"}`

`get-service |` `where-object {$_.ServiceName -like "net*" -and $_.Status -eq "running" }`

`Get-ChildItem | Where-Object {$_.Length -gt 41 -and $_.Name -like "*.exe"}`

[Microsoft's documentation for logical operators is here.](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-5.1)

And of course, you can always take a look at the example help for where-object cmdlet, here there are also examples for how to filter for multiple syntaxes. Just type`help where-object -example`.

## When not to output to the pipeline

Sometimes you will want to output informational text to standard out that does not need to be processed. This is actually the exception, since normally, you want to use the pipeline to get things done in PowerShell. At the same time, letting people know what's going on in your PowerShell routine can be useful. To output text without writing to the pipeline you use the `Write-Host` command.

When using `Write-Host` it is recommended to use different colors to offset this kind of information, making it clear that people should read this text.

Example: `Write-Host (2,4,6,8,10,12) -Separator ", -> " -ForegroundColor DarkGreen -BackgroundColor White`

In this example `Write-Host` outputs the numbers in the array, separated by a "-&gt;" with a while background and green text.

## Further pipeline reading

Microsoft has good documentation for powershell and we recommend that you also [take a look at their documentation about pipelines](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-5.1) to get more details on how to use the pipeline and alternative ways to pipeline objects for your PowerShell tasks.

## Some basic content formatting uses cases for the pipe

### **Send output to stdout as a formatted list**

```
Get-Process | Out-Host -Paging | Format-Table -Property ProcessName, Description
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
* Get reference for comparison operators
* Learning some useful use cases



