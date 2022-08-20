@{
    RootModule = 'PWSHCloudFlareAPI.psm1'
    ModuleVersion = '0.0.5'
    # CompatiblePSEditions = @()
    GUID = 'b35827fe-7ce3-4156-a19e-b97fc7338b55'
    Author = 'Adam Birds'
    CompanyName = 'ADB Web Designs'
    Copyright = '(c) Adam Birds. All rights reserved.'
    Description = 'Module for interacting with CloudFlare API.'
    PowerShellVersion = '5.1'
    # RequiredModules = @()
    # RequiredAssemblies = @()
    # ScriptsToProcess = @()
    # TypesToProcess = @()
    # FormatsToProcess = @()
    # NestedModules = @()
    FunctionsToExport = @(
        'Connect-CloudFlareAPI',
        'Get-CFDNSZone'
    )
    CmdletsToExport = @()
    AliasesToExport = @()
    FileList = @()
    PrivateData = @{
        PSData = @{
            Tags = @(
                'CloudFlare',
                'DNS',
                'API'
            )
            LicenseUri = 'https://github.com/adambirds/cloudflare-api-pwsh/blob/main/LICENSE'
            ProjectUri = 'https://github.com/adambirds/cloudflare-api-pwsh'
            IconUri = 'https://www.cloudflare.com/favicon.ico'
            ReleaseNotes = '
# 1.0.0

* Initial release.
            '
        }
    }
    HelpInfoURI = 'https://github.com/adambirds/cloudflare-api-pwsh'
}