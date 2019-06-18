# Tips and tricks you need for NetWorker ReST api

# PowerShell with vCenter communication  
PowerShell is your friend when you need some Information from vCenter like UUID  
[Virtual Machine PowerCLI One-Liners](https://vwiki.co.uk/Virtual_Machine_PowerCLI_One-Liners)   
[Mastering PowerCLI](https://searchvmware.techtarget.com/Mastering-PowerCLI-Using-Get-VM-to-work-with-virtual-machines)  

# Connect to the vcenter Server with your Windows PowerShell:  
Connect-VIServer -Server vcenter01 -User admin -Password pass  
```PS C:\> Connect-VIServer -Server vcenter01.demo.local -User administrator@demo.local -Password Password123!  ```  

# Get the UUID from the ESXi Server     
```PS C:\> Get-VMhost | Get-View | % { $_.hardware.systeminfo.uuid }  ```  

# Which VMs do you have    
```
PS C:\> Get—VM

Name                   PowerState   Num CPUs MemoryGB  
search_18.2.0.2410     PoweredOn       8       32.000  
emc-dpc—ova—18.2.0—4   PoweredOn       4        8.000  
AVE—01                 PoweredOn       2        6.000  
SQL—Ol                 PoweredOn       1        4.000  
0rac1eCentos           PoweredOn       1        3.906  
avproxy.demo.1oca1     PoweredOn       4        4.000  
NW—vproxy—insta11      PoweredOn       4        8.000  
AVE—02                 PoweredOn       2        6.000  
C1oudBoost-18.2.0      PoweredOn       4       16.000  
```
# Get a list of VMs with datastore and more  
```
Get-VM |
  Select Name,
@{N = 'GuestOS'; E = {$_.ExtensionData.Guest.GuestFullName}},
@{N = "Datastore"; E = {[string]::Join(',', (Get-Datastore -Id $_.DatastoreIdList | Select -ExpandProperty Name))}},
@{N = "UsedSpaceGB"; E = {[math]::Round($_.UsedSpaceGB, 1)}},
@{N = "ProvisionedSpaceGB"; E = {[math]::Round($_.ProvisionedSpaceGB, 1)}},
@{N = "Folder"; E = {$_.Folder.Name}},
@{N = "UUID"; E = {$_.Persistentid}} |  
  Sort-Object -Property Datastore
```
Get-VM test1 | Format-List *

```
Name               : SQL-01
GuestOS            : Microsoft Windows Server 2016 (64-bit)
Datastore          : Datastore2
UsedSpaceGB        : 44.1
ProvisionedSpaceGB : 44.1
Folder             : vm
UUID               : 5011cf93-a6d3-1bfb-1bc6-5c6f8b8299a8

Name               : NW-vproxy-installer-3.0.0-4
GuestOS            : SUSE Linux Enterprise 12 (64-bit)
Datastore          : LocalDS100Gb
UsedSpaceGB        : 13.1
ProvisionedSpaceGB : 164.4
Folder             : vm
UUID               : 501155ff-f70e-8ee6-b0ea-9f70f7680af6

Name               : OracleCentos
GuestOS            :
Datastore          : LocalDS100Gb
UsedSpaceGB        : 44.0
ProvisionedSpaceGB : 44.0
Folder             : vm
UUID               : 501123d1-0cba-d9af-bb3f-5f5937023d0c
 ```

# Get the UUID from individual VMs  
```  
PS C:\> Get-VM SQL-01 | %{(Get-View $_.Id).config.instanceUuid}  
564d099c-d5ac-023c-bcdf-262dcd43117a
```

# Get vCenter Server UUID  
```
PS C:\> Get-VC -Server vcenter01.demo.local | fl  

IsConnected   : True  
Id            : /VIServer=demo\administrator@vcenter01.demo.local:443/
ServiceUri    : https://vcenter01.demo.local/sdk
SessionSecret : "1440f77370739aa8bb665588f04dc0750bb267ba"
Name          : vcenter01.demo.local
Port          : 443
SessionId     : "1440f77370739aa8bb665588f04dc0750bb267ba"
User          : DEMO\Administrator
Uid           : /VIServer=demo\administrator@vcenter01.demo.local:443/
Version       : 6.5.0
Build         : 7801515
ProductLine   : vpx
InstanceUuid  : 3c3fd077-814a-44b4-911c-3be3eecb479d
RefCount      : 2
ExtensionData : VMware.Vim.ServiceInstance
Client        : VMware.VimAutomation.ViCore.Impl.V1.VimClient

```  

# Find you information on https://vcenter01.demo.local/mob   
Login !!
* let's find the vm, the content  
```
Search for: content	ServiceContent	content  
Click on: content  
```

__Navigate to the datacenter your vm is in__   
__Search for:__ rootFolder	ManagedObjectReference:Folder	group-d1 (Datacenters)  
__Click on:__ group-d1 (Datacenters)  

__Now reference the datastore you wanna browse__  
__Search for:__ datastore	ManagedObjectReference:Datastore[]	  
datastore-30 (LocalDS100Gb)  
datastore-62 (Datastore2)  
datastore-444 (Datastore)  
datastore-561 (RestoreDS1)    
__Click on:__ datastore-30 (LocalDS100Gb)

__Here youo will find the vms__  
__Search for:__ vm	ManagedObjectReference:VirtualMachine[]  	
vm-31 (OracleCentos)  
vm-487 (NW-vproxy-installer-3.0.0-4)  

__Click on:__ vm-31 (OracleCentos)    

__Get the config of the chosen vm__  
__Search for:__ config	VirtualMachineConfigInfo	config  
__Click on:__ config  

__Search for:__ instanceUuid   
here you will find a __string__	with the __uuid__ "501123d1-0cba-d9af-bb3f-5f5937023d0c"  
