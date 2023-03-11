Windows shell
====================

Customize the windows terminal and powershell with oh-my-posh.

## Getting started

### [Oh My Posh](https://ohmyposh.dev/docs/installation/windows)

Open a PowerShell prompt and run the following command:
```pwsh
winget install JanDeDobbeleer.OhMyPosh -s winget
```

This installs a couple of things:

* oh-my-posh.exe - Windows executable
* themes - The latest Oh My Posh themes

:warning: For the PATH to be reloaded, a restart of your terminal is advised.

After installing Oh My Posh. You need to change your prompt. We will change the powershell prompt but if you use another shell. View their [documentation how to change the prompt](https://ohmyposh.dev/docs/installation/prompt).

```pwsh
code $PROFILE
```

It will open a powershell script which permit to modify your profile. Copy/paste profile.ps1 from repo. Once added, reload your profile for the changes to take effect.

```pwsh
. $PROFILE
```

In summary the profile install required module to work properly then initialize Oh My Posh and autocomplete.

#### profile.ps1

install and import theses modules
* [Posh-Git](https://github.com/dahlbyk/posh-git)
* [Terminal-Icons](https://github.com/devblackops/Terminal-Icons)
* Update PSReadline - a module from powershell which need to be updated.

initialize Oh My Posh and autocomplete for dotnet and winget.

### [Oh My Posh font](https://ohmyposh.dev/docs/installation/fonts)

Oh My Posh was designed to use Nerd Fonts. Nerd Fonts are popular fonts that are patched to include icons. To see the icons displayed in Oh My Posh, install a Nerd Font, and configure your terminal to use it.

Oh My Posh has a CLI to help you select and install a Nerd Font:

:warning: This command needs to be executed as admin. The fonts are installed system wide.

Open a PowerShell prompt as admin and run the following command:
```pwsh
oh-my-posh font install
```

### Configuration

Make sure to configure your terminal to use the font you have installed.The following sections will show you how to do this for the most popular terminals.

#### Windows Terminal

:warning: To ensure correct rendering of the glyphs you will need to enable the option Use the new text renderer ("AtlasEngine") in your terminal settings. For further details, [see here.](https://github.com/microsoft/terminal/issues/8993)

Once you have installed a Nerd Font, you will need to configure the Windows Terminal to use it. This can be easily done by modifying the Windows Terminal settings (default shortcut: CTRL + SHIFT + ,). In your settings.json file, add the font.face attribute under the defaults attribute in profiles:
```json
{
    "profiles":
    {
        "defaults":
        {
            "font":
            {
                "face": "Your font here"
            }
        }
    }
}
```

You can modify the settings.json from the repo with the font you installed or use the default font which is FiraCode NF. Then copy/paste the settings.json into windows terminal settings. You can modify the settings.json to adapt to your style.

#### VS Code

When using Visual Studio Code, you will need to configure the integrated Terminal to make use of the Nerd Font as well. This can be done by changing the Integrated: Font Family value in the Terminal settings (default shortcut: CTRL + , and search for Integrated: Font Family or via Users -> Features -> Terminal).

If you are using the JSON based settings, you will need to update the terminal.integrated.fontFamily value. Example in case of FiraCode NF Nerd Font:

```json
"terminal.integrated.fontFamily": "FiraCode NF"
```

### Customize your prompt

You can customize your prompt by modifying posh.config.json. Profile.ps1 have a default theme which is posh.config.json. You can use another theme and add your own segments! Check theses [themes](https://ohmyposh.dev/docs/themes).
```pwsh
oh-my-posh --init --shell pwsh --config https://raw.githubusercontent.com/beauchama/windows-shell/main/posh.config.json | Invoke-Expression
```