New-AzAvailabilitySet -ResourceGroupName “Insert RGP name here” -Name “LBVMAVSet” -Location “WestUS2” -Sku “Aligned” -PlatformFaultDomainCount 2 -PlatformUpdateDomainCount 3

 $cred = Get-Credential

New-AzVm -ResourceGroupName "Insert RGP name here" -Name "LBVM1" -Location "WestUS2" -VirtualNetworkName "LBvNet" -SubnetName "Backend" -SecurityGroupName "LBVM1-nsg" -PublicIpAddressName "LBVM1-ip" -Credential $cred -size Standard_DS2_v2 -AvailabilitySetName "LBVMAVSet"


New-AzVm -ResourceGroupName "Insert RGP name here" -Name "LBVM2" -Location "WestUS2" -VirtualNetworkName "LBvNet" -SubnetName "Backend" -SecurityGroupName "LBVM2-nsg" -PublicIpAddressName "LBVM2-ip" -Credential $cred -size Standard_DS2_v2 -AvailabilitySetName "LBVMAVSet"