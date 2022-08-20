Function Get-CFDnsZone {
<#
.SYNOPSIS
    Return a list of all DNS zones in the current account or for the specified domain name.
.DESCRIPTION
    Return a list of all DNS zones in the current account or for the specified domain name.
.PARAMETER DomainName
    The domain name for which to return the DNS zone.
.EXAMPLE
    Get-CFDnsZone
.EXAMPLE
    Get-CFDnsZone -DomainName example.com
.NOTES
    Author: Adam Birds
#>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$DomainName
    )
    
    PROCESS {
        $Uri = $Script:APIUri + "zones"

        If ($DomainName) {
            $Uri = $Uri + "?domain=" + $DomainName
        }

        Try {
            $Response = Invoke-RestMethod -Uri $Uri -Method 'GET' -Headers $Script:Headers
            ForEach ($Zone in $Response.result) {
                [PSCustomObject]@{
                    Name = $Zone.name
                    ID = $Zone.id
                    Status = $Zone.status
                    Type = $Zone.type
                    Created = $Zone.created_on
                    Modified = $Zone.modified_on
                    Activated = $Zone.activated_on
                    NameServers = $Zone.name_servers
                    Owner = $Zone.owner
                    Account = $Zone.account
                    Permissions = $Zone.permissions
                    Plan = $Zone.plan
                    OriginalNameServers = $Zone.original_name_servers
                    OriginalRegistrar = $Zone.original_registrar
                    OriginalDnsHost = $Zone.original_dnshost
                }
            }
        } Catch {
            Throw $_
        }
    }
}