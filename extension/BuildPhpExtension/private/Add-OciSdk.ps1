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
        $remoteUrl = git config --get remote.origin.url
        $remoteUrl -match "github\.com[:/](.+?)/(.+?)(\.git)?$" | Out-Null
        $owner = $matches[1]
        $repository = $matches[2]
        $currentBranch = git rev-parse --abbrev-ref HEAD
        $downloadUrl = "https://raw.githubusercontent.com/$owner/$repository/refs/heads/$currentBranch/resources/instantclient.zip"
        Invoke-WebRequest $downloadUrl -OutFile "instantclient.zip"
        Expand-Archive -Path "instantclient.zip" -DestinationPath "../deps" -Force
        Add-Path -PathItem (Join-Path (Get-Location).Path ../deps)
    }
    end {
    }
}
