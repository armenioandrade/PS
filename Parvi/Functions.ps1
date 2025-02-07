#Create Remote PSSession
function CreateConnection {
    Clear-Host
    Write-Host "###PSSESSION CONNECTION MANAGER###"
    $computer = Read-Host "Type Computer Name"
    Enter-PSSession -ComputerName $computer
}

#Menu
function Menu() {
Clear-Host
Write-Host "Type an Option"
Write-Host "[1]-Create a PSSession"
Write-Host "[0]-Exit script"

$option = Read-Host

    switch ($option) {
        "2" {Invoke-Command -ComputerName NODE01 }
        "1" { CreateConnection }
        "0" {exit}
        Default {Write-Host "Invalid Option!"}
    }
    
}

function Get-ISCSIVolumeInfo(){
    # Get all volumes and filter those with BusType as iSCSI
$volumes = Get-Volume | Select-Object DriveLetter, FileSystemLabel, SizeRemaining, Size

# Output the information in a formatted way
foreach ($volume in $volumes) {
    $driveLetter = $volume.DriveLetter
    $label = $volume.FileSystemLabel
    
    # Determine size in appropriate unit (GB or TB)
    if ($volume.Size -ge 1TB) {
        $sizeTB = [math]::round($volume.Size / 1TB, 2)
        $sizeFormatted = "$sizeTB TB"
    } else {
        $sizeGB = [math]::round($volume.Size / 1GB, 2)
        $sizeFormatted = "$sizeGB GB"
    }

    # Determine free space in appropriate unit (GB or TB)
    if ($volume.SizeRemaining -ge 1TB) {
        $freeSpaceTB = [math]::round($volume.SizeRemaining / 1TB, 2)
        $freeSpaceFormatted = "$freeSpaceTB TB"
    } else {
        $freeSpaceGB = [math]::round($volume.SizeRemaining / 1GB, 2)
        $freeSpaceFormatted = "$freeSpaceGB GB"
    }
    
    # Output the formatted information
    Write-Output "Label: $label"
    Write-Output "Total Size: $sizeFormatted"
    Write-Output "Free Space: $freeSpaceFormatted"
    Write-Output ""
}
}
