# DELLEMC-DPS-ReST-api Avamar ave automation

Avamar configuration of a already deployed ave ova/ovf does mean you have to go through the conig gui
https://<ave>:7543/avi/avigui.html#page=SW_Releases  

To automate this procedure you need the information from the yaml file and add what you need in the  ave-20-Input-Params.yaml

Import the Postman environment  
Avamar.postman_environment.json  

Import the collection
AVE config automation.postman_collection.json

After the import yo do have all Rest API calls for a automated ave deployment.

If you are looking for a PowerCLI automation to get ave ova/ovf deployed have you look at:  
https://github.com/juergenschubert/DER-Video-Podcast-DPS/tree/master/PowerCLi%20ova%20deployment 
