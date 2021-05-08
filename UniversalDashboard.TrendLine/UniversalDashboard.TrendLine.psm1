$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDTrendLine {
    <#
    .SYNOPSIS
    Creates a trendline new component

    .DESCRIPTION
    Please see blog here https://psdevuk.github.io/ud-flix/Powershell-Universal-Component/

    .PARAMETER Id
    The ID of this editor

    .EXAMPLE
    New-UDTrendLine -ID "TRENDLINE" -AutoDraw -Smooth -StrokeWidth 2.1 -Duration 5000 -Data @(3,33,4,45,7,77,5,34)
    #>

    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [switch]$Smooth,
        [Parameter()]
        [switch]$AutoDraw,
        [Parameter()]
        [int]$Duration,
        [Parameter()]
        [ValidateSet('linear','ease','ease-in','ease-out','ease-in-out','step-start','step-end')]
        [string]$AnimationType = 'ease-out',
        [Parameter(Mandatory = $true)]
        [array]$Data,
        [Parameter()]
        [array]$Gradient = @('#f72047', '#ffd200', '#1feaea'),
        [Parameter()]
        [decimal]$Radius = 12.3,
        [Parameter()]
        [decimal]$StrokeWidth = 2.2,
        [Parameter()]
        [ValidateSet('butt','square','round')]
        [string]$StrokeEnd = 'square'

    )

    End {
        @{
            assetId = $AssetId
            isPlugin = $true
            type = "ud-trendline"
            id = $Id

            smooth = $Smooth.IsPresent
            autoDraw = $AutoDraw.IsPresent
            autoDrawDuration = $Duration
            autoDrawEasing = $AnimationType
            data = $Data
            gradient = $Gradient
            radius = $Radius
            strokeWidth = $StrokeWidth
            strokeLinecap = $StrokeEnd
        }
    }
}