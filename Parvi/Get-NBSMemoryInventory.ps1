# Lista de servidores
$servers = @("NODE08", "NODE09", "NODE10", "NODE11")

# Inicializar a lista para armazenar os dados das VMs
$vmList = @()

# ScriptBlock a ser executado remotamente
$scriptBlock = {
    Get-VM | Where-Object { $_.Name -like "*NBS*" } | Select-Object Name, MemoryAssigned
}

# Rodar o comando em cada servidor e consolidar os resultados
$results = Invoke-Command -ComputerName $servers -ScriptBlock $scriptBlock

# Adicionar os resultados à lista principal
$vmList += $results

# Adicionar os nomes de VMs adicionais ao vmList
$additionalVms = @(
    "PRVHDNBS10",
    "PRVHDNBS102",
    "PRVHDNBS103",
    "PRVHDNBS104",
    "PRVHDNBS105",
    "PRVHDNBS106",
    "S81PVNBS03HML",
    "PRVHDNBS100",
    "PRVHDNBS101",
    "PRVHDNBS108",
    "PRVHDNBS11",
    "PRVHDNBSRECAP01",
    "PRVHDNBS03",
    "PRVHDNBS107",
    "PRVHDNBS12",
    "S81PVNBS09"
)

foreach ($vmName in $additionalVms) {
    # Adicionar uma entrada fictícia com memória padrão
    $vmList += [PSCustomObject]@{
        Name = $vmName
        MemoryAssigned = 0 # Ajuste se você tiver valores reais de memória
    }
}

# Criar a lista final com memória em MB
$finalVmList = $vmList | ForEach-Object {
    [PSCustomObject]@{
        nome = $_.Name
        memoria = $_.MemoryAssigned / 1024 / 1024
    }
}

# Exportar para CSV
$finalVmList | Export-Csv -Path "vmList.csv" -NoTypeInformation

# Exibir a lista final para confirmação
$finalVmList
