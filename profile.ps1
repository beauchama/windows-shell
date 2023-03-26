# Install required module

if (!(Get-Module -ListAvailable posh-git))
{
    Install-Module posh-git -Scope CurrentUser -Force
}

if (!(Get-Module -ListAvailable Terminal-Icons))
{
    Install-Module Terminal-Icons -Scope CurrentUser -Force
}

if (!(Get-Module -ListAvailable PSReadline))
{
    Install-Module PSReadline -Scope CurrentUser -Force
}

# Import modules
Import-Module posh-git
Import-Module Terminal-Icons
Import-Module PSReadLine

# Initialize oh-my-posh config
oh-my-posh --init --shell pwsh --config https://raw.githubusercontent.com/beauchama/windows-shell/main/posh.config.json | Invoke-Expression

# PowerShell parameter completion for dotnet
# https://docs.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# PowerShell parameter completion for winget
# https://github.com/microsoft/winget-cli/blob/master/doc/Completion.md
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# Generate completion for gh
# https://cli.github.com/manual/gh_completion
Invoke-Expression -Command $(gh completion -s powershell | Out-String)