$domainName = "parvi.local"
$computers = $computers = Get-ADComputer -Filter *
($computers).Count


<##
foreach ($computer in $computers) {
    $computerName = $computer.Name
    $command = 'FortiESNAC.exe -r fortiems.parvi.com.br'
    $path = 'C:\\Program Files\\Fortinet\\FortiClient'
    $fullCommand = "Invoke-Command -ComputerName $computerName -ScriptBlock { Set-Location $using:path; $using:command }"
    Invoke-Expression $fullCommand
}

Write-Host "O comando foi executado em todos os computadores do domínio $domainName."
#>