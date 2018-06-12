# PowerShell Modules

Finally, we take a look at Powershell modules. Modules are essentially PowerShell libraries where you can store functions and, by installing these modules, persist them across PowerShell Sessions. Modules can be used to store and manage, and organize functions that you write to make managing your systems easier. Even better, these modules can be shared with other people to help them operate their systems too.

In this section, the focus is on loading PS-functions into your session automatically to speed up your personal work. We will also talk a little about finding and importing PS-Modules from the Powershell Gallery, but we will not touch on publishing PS-Modules to the gallery.

PowerShell modules are stored in files with the .psm1 extension, and the general workflow for personal-use modules is

* Create a local PS module repository
* save related functions as a module in a .psm1 file
* import the module
* use the functions directly from the command line

## Save your functions to a module file

Take one of the functions you have written and add it to a .psm1 file, and save your psm1 file to a central location. You can discover module repo paths by typing in `$env:PSModulePath`: i.e. you can store .psm1 files anywhere, but maybe it's not a bad idea to store them here since these folders are designed to store modules...

Powershell recognizes the .psm1 extension and authorizes use of the PowerShell "Module" commands on these files. 

## Import your module in your PS-Profile

Open your profile script in your favorite editor. For example, from the PS-Prompt I would type`code $profile`. to open my profile in VS Code. In your profile script, add `Import-Module <PathToYourModule>\<FileName>.psm1`. Now, when you open a new session the functions and whatever else is in your module is immediately available from the prompt.

PowerShell also automatically recognizes modules stored in a folder structure where the containing folder has the same base name as the file. If your folder structure follows this naming convention, you can also enter the path without the file name - provided that only .psm1 files reside in this folder. 

**Achtung**: If you haven't created a profile, [documentation for that is here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-6#how-to-create-a-profile)

## Use functions

Test it out. Open up a new console or application with an integrated powershell terminal, start typing in the function name and use autocomplete, rund the function. If it works you've successfully added module to your profile. 

# Finding and Importing Modules from the PS-Gallery



