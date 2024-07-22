#Generate Session

$RunAs = (Get-Credential)
Invoke-Command -ComputerName PRVSRVPOSH02.parvi.local -Credential $RunAs -ScriptBlock {
    Set-Location C:\PS
    .\VPNAutomationMultiple.ps1
}