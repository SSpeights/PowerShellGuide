# The Pipeline

The pipeline is one of the features that makes PowerShell such a powerful tool. If you have worked with Linux you probably already know how pipe works. Piping enables stringing commands together - using the pipe "\|" symbol - to pass the result of a command to the next command.

The difference between PS piping and Linux Shell piping is, that the PowerShell is passing the result of a command as a .NET object and not as text, providing you more ways to use this returned result. That's not important right now. What's important is that you can chain single commands to implement the "Get \| Process \| Output" pipeline, which is a common powershell output where three things happen.

* You get some data that you need
* You process that data and "do" something with it.
* You output the results of your processing

And you can repeat this pattern mutiple times, using the output of the previous pipeline a the "Get" data for the next one, enabling real power from the command line!

Example: Using the pipeline you get all the PS-Verbs, you filter the verbs - only showing the verbs in the security goup, and you output those groups to a file.

`get-verb | where-object {$_.Group -eq "Security"} | Out-file Security-Verbs.txt`

## 



