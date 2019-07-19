# DELLEMC-DPS-ReST-api NetWorker 18.2


This repository contains many ReST API collection for Postman https://www.getpostman.com/downloads/.
In this Postman collections I do work with an environment (postman_environment.json) where I define all variables needed to work with the ReST API like Server or login or auth token where needed and the api collection (postman_environment.json) where I do use this variables. So make sure you do import the environment plus the collection into Postman. I do recommend to import both files into Postman so you can work with. Do not forget to set the environment you have imported.


# Content
* NetWorker  
  * NetWorker 18.2
    * environment variables - postman_environment.json
    * Postman collection - postman_collection.json
      * Authenticate against a NW Server - How to login and what Rest endpoint to use with NetWorker
      * Demo workflow - create a client and backup a saveset to DD
        * Create a NetWorker client  
        * Create a protection group  
        * create a policy  
        * define a workflow for backup  
        * start a policy  
        * get a job information with logs  
      * Demo workflow for VMWare  
      * First Steps with Postman and NetWorker
        * REST API NetWorker 18.2.pptx

      # Useful Information  
      You will find postman_collection.json and postman_environment.json files which are the collection and the environment variables I am using to make things more transparent.
