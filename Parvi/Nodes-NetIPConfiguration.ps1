$NODES = @("NODE08", "NODE09", "NODE09", "NODE10", "NODE11")

foreach($node in $NODES){
    Invoke-Command -ComputerName $node -ScriptBlock {
        Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address
    }

}

<#

InterfaceAlias : Cluster
IPv4Address    : {10.0.15.202}
PSComputerName : NODE08
RunspaceId     : f0190779-11a7-423b-9662-37bdf7e41505

InterfaceAlias : iSCSI_FD01_S41Top-Te18_vlan11
IPv4Address    : {10.0.11.202}
PSComputerName : NODE08
RunspaceId     : f0190779-11a7-423b-9662-37bdf7e41505

InterfaceAlias : vEthernet (LAN)
IPv4Address    : {10.0.10.202}
PSComputerName : NODE08
RunspaceId     : f0190779-11a7-423b-9662-37bdf7e41505

InterfaceAlias : iSCSI_FD02_S41Bot-Te15_vlan12
IPv4Address    : {10.0.12.202}
PSComputerName : NODE08
RunspaceId     : f0190779-11a7-423b-9662-37bdf7e41505

InterfaceAlias : iSCSI_FD01_S41Top-Te17_vlan11
IPv4Address    : {10.0.11.203}
PSComputerName : NODE09
RunspaceId     : 92da46bb-ef49-4ba9-ace2-adfa15125e7a

InterfaceAlias : iSCSI_FD02_S41Bot-Te17_vlan12
IPv4Address    : {10.0.12.203}
PSComputerName : NODE09
RunspaceId     : 92da46bb-ef49-4ba9-ace2-adfa15125e7a

InterfaceAlias : Cluster
IPv4Address    : {10.0.15.203}
PSComputerName : NODE09
RunspaceId     : 92da46bb-ef49-4ba9-ace2-adfa15125e7a

InterfaceAlias : vEthernet (LAN)
IPv4Address    : {10.0.10.203}
PSComputerName : NODE09
RunspaceId     : 92da46bb-ef49-4ba9-ace2-adfa15125e7a

InterfaceAlias : iSCSI_FD01_S41Top-Te17_vlan11
IPv4Address    : {10.0.11.203}
PSComputerName : NODE09
RunspaceId     : 2860759e-e4bb-458d-bf26-d2641e1b37fb

InterfaceAlias : iSCSI_FD02_S41Bot-Te17_vlan12
IPv4Address    : {10.0.12.203}
PSComputerName : NODE09
RunspaceId     : 2860759e-e4bb-458d-bf26-d2641e1b37fb

InterfaceAlias : Cluster
IPv4Address    : {10.0.15.203}
PSComputerName : NODE09
RunspaceId     : 2860759e-e4bb-458d-bf26-d2641e1b37fb

InterfaceAlias : vEthernet (LAN)
IPv4Address    : {10.0.10.203}
PSComputerName : NODE09
RunspaceId     : 2860759e-e4bb-458d-bf26-d2641e1b37fb

InterfaceAlias : iSCSI_FD01_S41Top-Te15_vlan11
IPv4Address    : {10.0.11.205}
PSComputerName : NODE10
RunspaceId     : cfd98718-b30e-4e84-829a-3418a16bbdb1

InterfaceAlias : iSCSI_FD02_S41Bot-Te15_vlan12
IPv4Address    : {10.0.12.205}
PSComputerName : NODE10
RunspaceId     : cfd98718-b30e-4e84-829a-3418a16bbdb1

InterfaceAlias : vEthernet (LAN)
IPv4Address    : {10.0.10.205, 10.0.10.200}
PSComputerName : NODE10
RunspaceId     : cfd98718-b30e-4e84-829a-3418a16bbdb1

InterfaceAlias : Cluster
IPv4Address    : {10.0.15.205}
PSComputerName : NODE10
RunspaceId     : cfd98718-b30e-4e84-829a-3418a16bbdb1

InterfaceAlias : NIC6_SCSI_VLAN12
IPv4Address    : {10.0.12.204}
PSComputerName : NODE11
RunspaceId     : 21ac6d80-d04b-4fd5-9e03-46088634df1c

InterfaceAlias : Cluster
IPv4Address    : {10.0.15.204}
PSComputerName : NODE11
RunspaceId     : 21ac6d80-d04b-4fd5-9e03-46088634df1c

InterfaceAlias : vEthernet (LAN)
IPv4Address    : {10.0.10.204}
PSComputerName : NODE11
RunspaceId     : 21ac6d80-d04b-4fd5-9e03-46088634df1c

InterfaceAlias : NIC5_SCSI_VLAN11
IPv4Address    : {10.0.11.204}
PSComputerName : NODE11
RunspaceId     : 21ac6d80-d04b-4fd5-9e03-46088634df1c


#>