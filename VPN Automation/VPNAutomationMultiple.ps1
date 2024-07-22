#Reading input
$users = Read-Host("Users (separated by commas)")

# Split the users string into an array of users
$usersArray = $users -split ','

Write-Host "[1]-Full`n[2]-Portal"
$groupOption = Read-Host("From which group user will be removed")

if($groupOption -eq '1'){   
    $group = 'Parvi_VPN-Full_AcessoRadius'
}elseif ($groupOption -eq 2) {
    $group = 'Parvi_VPN-Portal_AcessoRadius'
}else {
    Write-Host "Invalid Option"
}

#Adding users to group
foreach ($user in $usersArray) {
    Add-ADGroupMember -Identity $group -Members $user -Confirm:$false
}


$dateStr = Read-Host("Removal date (dd/MM/yyyy HH:mm:ss)")
$date = [DateTime]::ParseExact($dateStr, 'dd/MM/yyyy HH:mm:ss', $null)

#Job creation
$trigger = New-JobTrigger -Once -At $date
$jobOption = New-ScheduledJobOption -RunElevated -RequireNetwork
$credential = Get-Credential 
$creationDate = Get-Date -Format "dd_MM_yyyy_HH_mm_ss"

Register-ScheduledJob -Name "VPN_${users}_${group}_${creationDate}" -Trigger $trigger -Credential $credential -scriptblock {
    param($group, $usersArray)
    foreach ($user in $usersArray) {
        Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false
    }
} -ScheduledJobOption $jobOption -ArgumentList $group, $usersArray
Clear-Host
Write-Host('Job scheduled!')
