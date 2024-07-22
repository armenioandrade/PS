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
        "1" { CreateConnection }
        "0" {exit}
        Default {Write-Host "Invalid Option!"}
    }
    
}

