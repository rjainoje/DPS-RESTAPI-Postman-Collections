$myVMs = Get-VM TST* | sort Name

$MyView = @()
ForEach ($myVM in $myVMs){
	$UUIDReport = [PSCustomObject] @{
			Name = $myVM.name 
			UUID = $myVM.extensiondata.Config.UUID
			InstanceUUID = $myVM.extensiondata.config.InstanceUUID
			LocationID = $myVM.extensiondata.config.LocationId
			MoRef = $myVM.extensiondata.Moref.Value
			}
	$MyView += $UUIDReport
	}
$MyView | ft -AutoSize