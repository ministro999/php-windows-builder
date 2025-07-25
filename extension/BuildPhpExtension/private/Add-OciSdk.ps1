Function Add-OciSdk {
    <#
    .SYNOPSIS
        Add sdk for OCI extensions.
    .PARAMETER Config
        The directory to add to PATH.
    #>
    [OutputType()]
    param(
        [Parameter(Mandatory = $true, Position=0, HelpMessage='Configuration for the extension')]
        [PSCustomObject] $Config
    )
    begin {
    }
    process {
        $url = "https://https://raw.githubusercontent.com/OSPanel/php-windows-builder/refs/heads/master/resources/instantclient.zip"
        Invoke-WebRequest $url -OutFile "instantclient.zip"
        Expand-Archive -Path "instantclient.zip" -DestinationPath "../deps" -Force
        Add-Path -PathItem (Join-Path (Get-Location).Path ../deps)
    }
    end {
    }
}
