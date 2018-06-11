# Configure your PS  environment

The next step after getting Powershell is to configure how Powershell should function on your system and what resources you would like to have. You can configure PS environment behavior in your PowerShell profile\(s\). There are different profile configurations with different scopes in PowerShell.

## PowerShell profile

PowerShell Profile is a script that allows you to configure your Powershell environments with custom configurations that persist for every PowerShell session. The Profile script runs at session-start and you can configure commands, aliases, variables and, yes, also functions that you want to be able to access from PowerShell in this file. For an in-depth look at PowerShell Profiles, [take a look at the Microsoft reference documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-6). Pay special attention to the different profile scopes. The different scopes are:

| Description | Reference | Path |
| :--- | :--- | :--- |
| Current user, Current Host | $profile | $Home\\[My \]Documents\WindowsPowerShell\Profile.ps1 |
| Current User, All Hosts | $profile.CurrentUserAllHosts | $Home\\[My \]Documents\Profile.ps1 |
| All Users, Current Host | $profile.AllUsersCurrentHost | $PsHome\Microsoft.PowerShell\_profile.ps1 |
| All Users, All Hosts | $profile.AllUsersAllHosts | $PsHome\Profile.ps1 |

**Achtung: **Your PowerShell Profile can be set for different scopes and you will want to understand what these are. Take a look at the four different profiles in the online documentation. You definitely also want to know more about the full capabilities of PowerShell profile.

## Persisting Resources

It is possible to do useful stuff like setting the default home directory or not so useful stuff like setting the background color of your PS-console, but PowerShell profiles most useful feature is allowing you to store resources that you need to reuse on a regular basis and not just for your machine but also for all hosts that you need to manage. The following are some links that show, which resources can go into a profile and how to persist them.

**Achtung:** As of Powershell 3.0 you don't have to load PS-Modules into your profile to manage them. After installed, modules are available at every session. That being said, it still makes sense to add variables, console configurations, and special, state-based prompts to your profile that you wish to have in your PS-environment.

