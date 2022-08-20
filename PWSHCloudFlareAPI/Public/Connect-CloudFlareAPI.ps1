Function Connect-CloudFlareAPI {
<#
.SYNOPSIS
    Connects to the CloudFlare API for future requests.
.DESCRIPTION
    Connects to the CloudFlare API for future requests.
.PARAMETER APIKey
    The API key to use for authentication.
.PARAMETER Email
    The email address to use for authentication.
.EXAMPLE
    Connect-CloudFlareAPI -APIKey "xxxxxxxxxxxxxxxxxxx" -Email "john.doe@example.com"
.NOTES
    Author: Adam Birds

#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [String]$APIKey,
        [Parameter(Mandatory = $true)]
        [String]$Email
    )

    PROCESS {
        $Headers = @{
            'X-Auth-Key'   = $APIKey
            'X-Auth-Email' = $Email
        }

        $Uri = $Script:APIUri + "user/"

        try {
            Write-Verbose  'Connect-CloudFlareAPI: Attempting to connect to CloudFlare...'
            $null = Invoke-RestMethod -Uri $Uri -Headers $Headers -Method GET
            Write-Verbose  'Connect-CloudFlareAPI: Successfully connected to CloudFlare.'

            $Script:Headers = $Headers
        }
        catch {
            Throw $_
        }
    }
}