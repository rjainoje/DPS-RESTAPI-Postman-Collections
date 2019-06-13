# DELLEMC-DPS-ReST-api NetWorker 18.2

This repository contains many ReST API collection for Postman https://www.getpostman.com/downloads/.  
In this Postman collections I do work with an envirnment (_environment.json) where I define all variables needed to work with the ReST Api like Server or login or auth token where needed and the api collection (_collection.json) where I do use this variables. So make sure you do import the environment plus the collection into Postman.

You will find postman_collection.json and postman_environment.json files which are the collection and the environment variables I am using to make things more transparent. I do recommand to import both files into Postman so you can work with. Do not forget to set the environment you have imported.

# Content
* NetWorker  
  * NetWorker 18.2
    * environment variables - postman_environment.json
    * Postman collection - postman_collection.json
      * Authenticate against a NW Server - How to login and what Rest endpoint to use with NetWorker
      * Demo workflow - create a client and backup a saveset to DD
        * Create a NetWorker client  
        * Create a Protectiongroup  
        * create a policy  
        * define a workflow for backup  
        * start a policy  
        * get a job information with logs  
      * Demo workflow for VMWare  

# swagger file

When having a swagger api file like one from NetWorker you can use http://editor.swagger.io/#/ and add the swagger file so you do have better option to see what api calls are available to use. Use NetWorker administrator and password for login.  
NetWorker always uses this swagger file: https://{{server}}:9090/nwrestapi/v3/schemas/swagger.json

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
PS C:\> Get-VM SQL-01 | %{(Get-View $_.Id).config.uuid}  
564d099c-d5ac-023c-bcdf-262dcd43117a
```  

```    
# Get vCenter Server UUID  
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
