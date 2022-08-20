$Script:APIUri = "https://api.cloudflare.com/client/v4/"

#Dot source all functions in all ps1 files located in the module's public and private folders, excluding tests and profiles.
Get-ChildItem -Path $PSScriptRoot\Public\*.ps1, $PSScriptRoot\Private\*.ps1 -Exclude *.tests.ps1, *profile.ps1 -ErrorAction SilentlyContinue |
ForEach-Object {
    . $_.FullName
}