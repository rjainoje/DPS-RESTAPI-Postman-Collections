# PowerShell with vCenter communcation  
PowerShell is your friend when you need some Information from vCenter like UUID  
https://vwiki.co.uk/Virtual_Machine_PowerCLI_One-Liners

# Connect to the vcenter Server with:  
Connect-VIServer -Server vcenter01 -User admin -Password pass  
```PS C:\> Connect-VIServer -Server vcenter01.demo.local -User administrator@demo.local -Password Password123!  ```  

# Get the UUID from the ESXi Server     
```PS C:\> Get-VMhost | Get-View | % { $_.hardware.systeminfo.uuid }  ```  

# Which VMs do you have    
```
PS C:\> get—VM

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

# Find you infromation on https://vcenter01.demo.local/mob   
Login !!
__let's find the vm, the content__  

__Search for:__ content	ServiceContent	content  
__Click on:__ content  


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
