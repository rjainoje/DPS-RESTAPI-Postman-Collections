# DELLEMC-DPS-ReST-api NetWorker NVE automation

NetWorker configuration of an already deployed ave ova/ovf does mean you have to go through the conig gui
https://<nve>:7543/avi/avigui.html  

To automate this procedure you need the information from the yaml file and add what you need in the  
NVE-19-2-Input-Params.yaml

Import the Postman environment  
NetWorker.postman_environment.json  

Import the collection
NVE config automation.postman_collection.json

After the import yo do have all Rest API calls for a automated ave deployment.

If you are looking for a PowerCLI automation to get ave ova/ovf deployed have you look at:  
https://github.com/juergenschubert/DER-Video-Podcast-DPS/tree/master/PowerCLi%20ova%20deployment
