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
* Get-VMHostUUID.ps1 - script to get VM PowerShell from: http://thephuck.com/scripts/script-to-pull-host-uuid-for-vmware-powercli/
Usage is like this:  
Get-VMHostUUID.ps1 -vmhosts ("host1","host2","host3") or  
Get-VMHostUUID.ps1 -vc vcenterserver -container cluster1/folder/dc/etc  

you need to have PowerShell installed  

iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
