ReST api for DELL EMC DPS products like NetWorker, DataDomain, Avamar, and more

This repository contains many ReST API collection for Postman https://www.getpostman.com/downloads/.  
In this Postman collections I do work with an envirnment (_env) where I define all variables needed to work with the ReST Api like Server or login or auth token where needed and the api collection (_col) where I do use this varibales. So make sure you do import the environment plus the collection

There are ReST API commands for NetWorker

# Content
* NetWorker  
  * NetWorker 19.1  
    * environment variables
    * Authenticate against a NW Server      
  * NetWorker 18.2  
      * environment variables
      * Authenticate against a NW Server  
      * Swagger File for internal use.


      When having a swagger api file like NetWorker you can use http://editor.swagger.io/#/ and add the swagger file so you do have better option to see what you can use. Use adminstrator and password for login.
      NetWorker always uses this swagger file: https://{{server}}:9090/nwrestapi/v3/schemas/swagger.json
