# PowerShell Modules

Finally, we take a look at Powershell modules. Modules are essentially PowerShell libraries where you can store functions and, by installing these modules, persist them across PowerShell Sessions. Modules can be used to store and manage, and organize functions that you write to make managing your systems easier. Even better, these modules can be shared with other people to help them operate their systems too. [Microsoft Reference documentation for PowerShell Modules is here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-6).

[A good definition for all of the components of a module is here](https://msdn.microsoft.com/en-us/library/dd878324%28v=vs.85%29.aspx).

In this section, the focus is on loading PS-functions into your session automatically to speed up your personal work. We will also talk a little about finding and importing PS-Modules from the Powershell Gallery, but we will not touch on publishing PS-Modules to the gallery.

PowerShell modules are stored in files with the .psm1 extension, and the general workflow for personal-use modules is

* Save related functions, session variables and other resources as a module in a .psm1 file
* import the module
* use the functions directly from the command line

## Save your functions to a module file

Take the function you copied in your PS-Profile, cut it out, add it to a .psm1 file, and save your psm1 file to a central location. 

**Achtung**: You can discover module repo paths by typing in `$env:PSModulePath`: i.e. you can store .psm1 files anywhere, but maybe it's not a bad idea to store them here since these folders are designed to store modules...

Powershell recognizes the .psm1 extension and authorizes use of the PowerShell "Module" commands on these files.

[Supporting documentation for writing a script module is here.](https://msdn.microsoft.com/en-us/library/dd878340%28v=vs.85%29.aspx)

## Import your module in your PS-Profile

Open your profile script in your favorite editor. For example, from the PS-Prompt, I would type`code $profile` to open my profile in VS Code. In your profile script, add `Import-Module <PathToYourModule>\<FileName>.psm1`. Now, when you open a new session the functions and whatever else is in your module is immediately available from the prompt.

PowerShell also automatically recognizes modules stored in a folder structure where the containing folder has the same base name as the file. If your folder structure follows this naming convention, you can also enter the path without the file name - provided that only .psm1 files reside in this folder.

**Achtung**: If you haven't created a profile, [documentation for that is here](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Import-Module?view=powershell-6#description).

## Use module resources

Test it out. Open up a new console or application with an integrated powershell terminal, start typing in the function name and use autocomplete, run the function a couple of times. If it works, you've successfully added module to your profile. If you need to see which commands, you can use in your module, type in:

`Get-Command -Module <YourModuleName>`

## Next steps with modules

If you need to have "self-describing" modules, you can generate module meta-data by creating something called a module manifest. Module manifests help to describe the contents of a module and also to help avoid naming collisions by creating name spaces and so on. PowerShell has auto-generate capabilities for module manifests, [using the `New-ModuleManifest` cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/new-modulemanifest?view=powershell-6#description).

If you are writing modules that need to the well-labeled, you may want to look into creating manifests for your modules. But, manifest files are not required to use PS-Modules.

# Finding and Importing Modules from the PS-Gallery

Workflow

Finding modules

Inspecting Modules

Installing Modules

Module Discovery

