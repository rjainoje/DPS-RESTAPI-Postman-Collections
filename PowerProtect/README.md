# DELLEMC-DPS-Postman-Collections-RESTAPI for PowerProtect
Download or clone the repo and import PowerProtect 19.5 Environment.postman_environment.json and PowerProtect 19.5.postman_collection.json files into Postman.

## Power Protect Data Manager (PPDM) 19.5
Once you import collections and environment variables (both are JSON), you need to modify the following environment variables.

```
ppdmsrv - enter your PPDM server or ip
ppdmuser - PPDM admin user id
ppdmpasswd - Password

vcenter-host - vcenter host/ip, only needed when you want to perform image restore of a VM
vcenter-username - vcenter username only needed when you want to perform image restore of a VM
vcenter-password - vcenter password only needed when you want to perform image restore of a VM
```

The rest of the variables will be updated automatically based on the API response.

How can you use this?
Try various calls (around 25 of them) and then try going through the use cases, such as adding assets to the policy, trigger manual backup of a VM or a policy or perform a Image Level restore of a VM.
The use cases require you to execute them sequentially, you can use "runner" option in the Postman and select the use case with all the tasks, it will execute all of them.

For example, the use case for performing an Image Level Restore of a VM requires all the 10 calls in the Use Case 4 to be executed.

![](images/ppdm.PNG)

# Content
* PowerProtect 
    * PowerProtect 19.1
	* there was no REST API available with 19.1
    * PowerProtect 19.2
        * environment variables
        * automation request for PowerProtect
     * PowerProtect 19.3
        * environment variables
        * automation request for PowerProtect
     * PowerProtect 19.5
        * environment variables
        * automation request for PowerProtect
