# List of Hyper-V hosts
$servers = @("NODE08", "NODE09", "NODE10", "NODE11")

# Function to get VM details from each server
$scriptBlock = {
    Get-VM | Select-Object Name, ProcessorCount
}

# Initialize an empty array to store the results
$allVMs = @()

# Loop through each server and collect VM details
foreach ($server in $servers) {
    $vms = Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock
    $vms | ForEach-Object {
        [PSCustomObject]@{
            ServerName    = $server
            VMName        = $_.Name
            ProcessorCount = $_.ProcessorCount
        }
    } | ForEach-Object { $allVMs += $_ }
}

# Display the results
$allVMs | Format-Table -AutoSize

# Calculate the total number of vCPUs
$totalvCPUs = ($allVMs | Measure-Object -Property ProcessorCount -Sum).Sum

# Display the total
Write-Host "Total vCPUs allocated: $totalvCPUs"
