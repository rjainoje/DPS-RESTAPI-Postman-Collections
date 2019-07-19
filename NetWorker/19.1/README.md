# DELLEMC-DPS-ReST-api NetWorker 19.1

This repository contains many ReST API collection for Postman https://www.getpostman.com/downloads/.
In this Postman collections I do work with an environment (postman_environment.json) where I define all variables needed to work with the ReST API like Server or login or auth token where needed and the api collection (postman_environment.json) where I do use this variables. So make sure you do import the environment plus the collection into Postman. I do recommend to import both files into Postman so you can work with. Do not forget to set the environment you have imported.

# Content
* NetWorker  
  * NetWorker 19.1
    * Authenticate against a NW Server - How to login
    * ReST endpoints  
    * Demo workflow - create a client and backup a saveset to DD
      * Create a NetWorker client  
      * Create a Protectiongroup  
      * create a policy  
      * define a workflow for backup  
      * start a policy  
      * get a job information with logs  
    * Demo workflow for VMWare
    * under construction - Use Case automation
        * ServiceNow add VM Client
            * Get list of current protected VMs
            * Get list of unprotected VMs
            * decide which VM to backup
            * Get client into Backup mode (easy for VMWare backup)
            * Check for Backup Proxy for this client
            * See what Backup Policy this client should belong to
            * Add Client to right policy
            * Execute the first backup
            * Return the Backup Job ID for this
        * Create policy templates
            * create policy
            * create workflow

# swagger file
When having a swagger api file like one from NetWorker you can use http://editor.swagger.io/#/ and add the swagger file so you do have better option to see what api calls are available to use. Use NetWorker administrator and password for login.
NetWorker always uses this swagger file: https://{{server}}:9090/nwrestapi/v3/schemas/swagger.json.  
If you are not online with your NetWorker Server you can easy download the swagger file with:  
```
java -jar swagger-codegen-cli-2.4.5.jar generate -i ./swagger.json -l python -o REST_API
```

# Swagger Codegen  
The Swagger Codegen is an open source code-generator to build server stubs and client SDKs directly from a Swagger defined RESTful API. The source code for the Swagger Codegen can be found in GitHub.

GitHub: https://github.com/swagger-api/swagger-codegen

You can first download the swagger file and then run the utility to generate python client code.   
If curl is available then run  
```
curl -vvv -k -X GET https://10.31.227.39:9090/nwrestapi/v3/schemas/swagger.json >> swagger.json
```
Generate the code
```
java -jar swagger-codegen-cli-2.4.5.jar generate -i ./swagger.json -l python -o REST_API
```
# Usefull Information  
You will find postman_collection.json and postman_environment.json files which are the collection and the environment variables I am using to make things more transparent.
