#Importing functions
. "$PSScriptRoot\Functions.ps1"
Invoke-Command -ComputerName NODE01 -File .\Get-ISCSIVolumeInfo.ps1