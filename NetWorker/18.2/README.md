# DELLEMC-DPS-ReST-api NetWorker 18.2

When having a swagger api file like one from NetWorker you can use http://editor.swagger.io/#/ and add the swagger file so you do have better option to see what we can use. Use administrator and password for login.
NetWorker always uses this swagger file: https://{{server}}:9090/nwrestapi/v3/schemas/swagger.json

You will find postman_collection.json and postman_environment.json files which are the collection and the environment variables I am using to make things more transparent. I do recommand to import both files into Postman so you can work with. Do not forget to set the environment you have imported.

# Content
* NetWorker  
  * NetWorker 18.2
    * environment variables - postman_environment.json
    * Postman collection - postman_collection.json
      * Authenticate against a NW Server - How to login and what Rest endpoint to use with NetWorker
      * Demo Workflow - create a client and backup a saveset to DD
        * Create a NetWorker Client
        * Change saveset for client
