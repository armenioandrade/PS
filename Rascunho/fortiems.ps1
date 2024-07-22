# PowerShell script to execute the FortiESNAC.exe command in the specified folder
$computers = @("N81PVCOMSARA","N81DOCRICARDO")
# Define the folder path
$folderPath = "C:\Program Files\Fortinet\FortiClient"

# Define the command to execute
$command = "FortiESNAC.exe -r fortiems.parvi.com.br"

Invoke-Command -ComputerName $computers -ScriptBlock{
foreach($pc in $computers){
    Set-Location -Path $folderPath
    Invoke-Expression -Command $command
}
}

# Change the working directory to the specified folder


# Execute the command


# Print a success message
Write-Host "Command executed successfully in $folderPath"


