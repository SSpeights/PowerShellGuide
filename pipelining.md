# The Pipeline

The pipeline is one of the features that makes PowerShell such a powerful tool. If you have worked with Linux you probably already know how pipe works. Piping enables stringing commands together - using the pipe "\|" symbol - to pass the result of a command to the next command. Piping objects is the most powerful feature of PowerShell and 

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

The pipeline enables fine control of the 

It is possible to manipulate the objects returned and the format of these object. Where-Object statement and comparison operators - $\_ means this.object

Controlling formats

Forcing to the streams -passthru

looping - foreach statement

It is also possible to designate "which" streams receive pipeline output. Different streams like debugging, error and so on.

## When not to output to the pipeline

stdout messaging for routine

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
* Learning some useful examples for important use cases



