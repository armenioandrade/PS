# Get all volumes and filter those with BusType as iSCSI
#$volumes = Get-Volume | Select-Object DriveLetter, FileSystemLabel, SizeRemaining, Size
$volumes = Get-Volume | Where-Object { $_.FileSystemLabel -eq "VL-DATA31_SSD" } | Select-Object @{Name="SizeRemainingGB";Expression={[math]::round($_.SizeRemaining / 1GB, 2)}}

foreach ($volume in $volumes) {
    Write-Output "$($volume.SizeRemainingGB)"
}