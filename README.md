# ScriptHub Fork

For users who want to run simple scripts, to changing the background on a unlicenced Windows, ScriptHub is there for you. This fork allows for a more convient and enchanced experience (No major changes to the original yet, project just started)

# What Can ScriptHub do?

This is used to setup your computer with tweaks and is overall a decent lightweight toolbox

# What Features Are New?

- Scripts are not hard-coded into ScriptHub
- Using a command line like interface at the moment
- Themes
- Fully working dark mode toggle
- Disabling Windows Start Menu search results

# Missing parts of this fork

This fork is a complete overhall of the original. This pre-release version doesn't have everything the original has. For example, you can't set a background yet

# What Feautres Are Coming To This Fork Of ScriptHub?

Hopefully it will have the following:

- ScriptHub theme picker and switcher
- TUI like the original instead of a CLI
    - Hoping to get theme support working well with that
- Maybe have 2 Windows Personalization scripts
    - Theme Picker
        - Default themes at C:\Windows\Resources
        - User themes at %LOCALAPPDATA%\Microsoft\Windows\Themes
    - Background Picker
        - Desktop and lockscreen backgrounds
    - Windows 10 Specific
        - Small taskbar
    - Windows 11 Specific
        - Center/Left alligned taskbar
- Have a updater
- Add external repos via link
    - I should link a Github template repo to the readme when done
- Impliment [Robocopy](https://github.com/ChrisTitusTech/win10script/blob/master/Individual%20Scripts/robocopy.ps1)
- Impliment [Group Policy Editor](https://github.com/ChrisTitusTech/winutil/blob/main/gpedit-home.ps1)
- Essentually grab tools from [winutil](https://github.com/ChrisTitusTech/winutil/tree/main/functions/private)
    - winutil is cool, but I don't like the forced requirement of installing choco + winget. 
- See if having most the code in a module can make self-updating better and actually do a in-place update