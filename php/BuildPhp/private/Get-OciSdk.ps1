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
    }
    process {
        $remoteUrl = git config --get remote.origin.url
        $remoteUrl -match "github\.com[:/](.+?)/(.+?)(\.git)?$" | Out-Null
        $owner = $matches[1]
        $repository = $matches[2]
        $currentBranch = git rev-parse --abbrev-ref HEAD
        $downloadUrl = "https://raw.githubusercontent.com/$owner/$repository/refs/heads/$currentBranch/resources/instantclient.zip"
        Invoke-WebRequest $downloadUrl -OutFile "instantclient.zip"
        Expand-Archive -Path "instantclient.zip" -DestinationPath "."      
    }
    end {
    }
}
