One way to get a list of different computers is to use a subcommand in a cmdlet to build an array of computer names.

subcmdlets are packed in parentheses \(get-content file-with-computernames.txt \).

Variables: variables start with a $ and essentially represent whatever object they contain. No typing.

There are four different kinds of pipelines.

Out cmdlets come at the end of the expression because this is the output of the pipeline

Tee Object will send to pipeline and file

Stream Redirection - all of the different pipelines are sent to different streams. The streams have a number and redirecting streams is done using &gt;, &gt;&gt;. Merging stream is done by &gt;& only possible to merge to the success stream.

This is useful for debugging- appending to file instead of stdout.

$\_ indicates the current object in the pipeline

foreach {  } the foreach with block means that for each objec the code in the block with be executed.

cmdlet \| where {  } returns all the members of the object that meet the where condition. get-service \| where {$\_.status $eq 'running'} - in plain text get all services and output each service that has the "running" status.

foreach enumerator is a loop in a script and does not write to the pipeline returned vals must be added to a variable.

for cmdlets that don't write to the pipeline by default you can use -passthru attribute to write to pipeline.

Write-Host does not output to pipeline - use a different color to differentiate. WH can be used for messages in a PS stdout routine.

Variable expansion works with double quotes but not single quotes.

Can use subexpressions in strings to display object values dynamically - will be treated as a variable. 

