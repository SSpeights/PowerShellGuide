## Dev environments for scripting

What will you eventually want to be able to do. Before we take a look at some of the IDEs out there, remember, when we develop at work - at least in Freiburg - we have to take our corporate proxy server into account. If ICT has not given you a proxy exemption or a special script that helps your system to know when you're behind the proxy and when you're not, please ask them if they can help. Otherwise, if you insist on doing it yourself, use "[http://proxy.haufemg.com:8083/](http://proxy.haufemg.com:8083/)" to resolve the proxy server, useful for things like pushing to remote git repository or downloading dependencies from your favorite package repo. This may not be so critical for some powershell tasks but if you are doing something like managing a cloud environment remotely, you will need to be able to "get out".

### Visual Studio Code with PS Add-On

There are other options but VS Code has a very good powershell plugin. The plugin has a very good reputation and has almost 2 million downloads! Microsoft makes great IDEs, and Visual Studio Code with the PS plugin and the embedded PS-terminal is a powerful development environment for PowerShell scripting: It has full intellisense support and you can run your script from the IDE. The great thing here is that not only can you develop PS-Scripts mega-fast in this lightweight environment, you can also develop everything else! I have to admit this is my first choice...

### Visual Studio with PS Tools

The big brother of VS Code. If you develop with Microsoft technologies chances are that you have Visual Studio on your dev machine. Visual Studio also has a plugin for Powershell that provides full intellisense support. You can find and install this plugin directly from the IDE.

### Atom with PS Add-On

Another great editor is "Atom" from the folks at GitHub. Atom is another popular editor where you can do a lot of the same things as in VS Code and Atom also has a well-liked Powershell plugin that has a not-trivial 70,000 downloads. If you don't want to bow down to Microsoft, maybe check out atom. One thing about Atom: I had trouble getting her to work from behind our beloved proxy server - if you dev in Windows you may want to stick with VS Code because configuring the proxy works like butter.

### ISE

ISE is the native PS IDE: it is installed on every newer Windows computer. Instead of openining PS console on your machine, you can choose to open PS-ISE, which is a mix of a console, a coding stage, and graphical interface similar to VS Code, but,, exclusively made for scripting in Powershell. 

For Haufe Group, I don't recommend... It's simply not hard-core enough because it enables PS-scripters to replace the command line with GUI controls for tasks like command search, which, IMVHO, leads to bad working habits. Plus, it's been developed exclusively to create PowerShell scripts. Remember exclusively using the command line is in the long-run faster - mixing CLI and GUI will just slow you down and be confuse you. If you don't want to look for anything, this is already on your windows machines.

### Other IDEs

It may be a requirement to run your scripts from other IDEs because you have dependencies that may only be accessed via this environment. To be honest, I don't know what exactly these requirements are. One example though is that, for some products, QA people must run scripts in the UFT test automation environment to call UFT functionality for creating reports in UFT or for running tests that are located in the UFT repository. Or, it may just be that you like another editor better. If there is good powershell support, more power to you.

In any case, specific dependencies for development and testing are out of scope for this book. We are only going to be looking at PowerShell, with maybe one or two exceptions. Maybe you will decide that PowerShell provides a better alternative for some or all of your use cases and enables you to get rid of some of those annoying dependencies. In the next section, we will prime you a little bit more by showing you the how powershell is set up. Once you've scanned "PowerShell Framework", you will be ready to start locating useful PowerShell resources that can help you do your work.

## Section Targets:

* Have some choices for your PowerShell Dev Environment



