# DELLEMC-DPS-ReST-api
ReST api for DELL EMC DPS products like NetWorker, DataDomain, Avamar, and more

This repository contains many ReST API collection for Postman https://www.getpostman.com/downloads/.  
In this Postman collections I do work with an envirnment (_env) where I define all variables needed to work with the ReST Api like Server or login or auth token where needed and the api collection (_col) where I do use this varibales. So make sure you do import the environment plus the collection

When having a swagger api file like NetWorker you can use http://editor.swagger.io/#/ and add the swagger file so you do have better option to see what we can use.

There are ReST API commands for NetWorker, Avamar, DataDomain and more will follow

# Content
* NetWorker  
  * NetWorker 19.1  
    * environment variables
    * Authenticate against a NW Server
  * NetWorker 18.2  
    * environment variables
    * Authenticate against a NW Server  
* Avamar  
  * Avamar 19.1
    * environment variables
    * Authenticate against an ave host  
  * Avamar 18.2
    * environment variables
    * Authenticate against an ave host  
* DataDomain
  * DataDomain
  * DataDomain Management Center
* ECDM

# Connect to the vcenter Server with:
Connect-VIServer -Server vcenter01 -User admin -Password pass  
Connect-VIServer -Server vcenter01.demo.local -User administrator@demo.local -Password Password123!  

# Get the UUID from the ESXi Server   
Get-VMhost | Get-View | % { $_.hardware.systeminfo.uuid }  

# Which VMs do you have
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

# Get the UUID from individual VMs  
Get-VM SQL-01 | %{(Get-View $_.Id).config.uuid}
