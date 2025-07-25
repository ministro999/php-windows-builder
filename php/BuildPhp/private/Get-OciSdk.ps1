function Get-OciSdk {
    <#
    .SYNOPSIS
        Add the OCI SDK for building oci and pdo_oci extensions

    .PARAMETER Arch
        The architecture of the OCI sdk.
    #>
    [OutputType()]
    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = 'The architecture of the OCI sdk.')]
        [string]$Arch
    )
    begin {
        $url = "https://raw.githubusercontent.com/OSPanel/php-windows-builder/refs/heads/master/resources/instantclient.zip"
    }
    process {
        Invoke-WebRequest $url -OutFile "instantclient.zip"
        Expand-Archive -Path "instantclient.zip" -DestinationPath "."      
    }
    end {
    }
}
