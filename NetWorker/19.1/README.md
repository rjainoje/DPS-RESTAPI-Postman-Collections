# DELLEMC-DPS-ReST-api NetWorker 19.1

When having a swagger api file like NetWorker you can use http://editor.swagger.io/#/ and add the swagger file so you do have better option to see what we can use. Use adminstrator and password for login.
NetWorker always uses this swagger file: https://{{server}}:9090/nwrestapi/v3/schemas/swagger.json

You will find postman_collection.json and postman_environment.json files which are the collection and the environment variables I am using to make things more transparent. I do recommend to import both files into Postman so you can work with. Do not forget to set the environment you have imported.

# Content
* NetWorker  
  * NetWorker 19.1
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

    When having a swagger api file like NetWorker you can use http://editor.swagger.io/#/ for better api understanding

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
