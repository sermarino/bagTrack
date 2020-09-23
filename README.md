
# Baggage tracking prototype using Hyperledger Fabric

## INSTALLATION

### STEP 1
First of all you need to get the *fabric-samples* folder. To do this, go to [https://github.com/hyperledger/fabric-samples](https://github.com/hyperledger/fabric-samples)

### STEP 2
For proper operation, the repository **bagTrack** must be placed inside *fabric-samples* folder

The *baggage* repository **inside** *chaincode* repo must be placed inside `fabric-samples/chaincode`

### STEP 3 
Move to `bagTrack` and run `ricarica.sh` or `starFabric.sh` to start the network.  
To interact with ledger, you need to move inside `bagTrack/javascript` and start one of the scripts.


## HOW DOES IT WORKS?

There are two folders: **bagTrack** and **chaincode** 

### bagTrack
**bagTack** contains the scripts to run to start the network and the chaincode package to install.  
`starFabric.sh` The script you need to start the network   
`ricarica.sh` The script you need to restart the network  
`networkDown.sh` The script you need to stop the network  
`baggage.tar.gz` The chaincode package to install  

#### javascript folder
Inside the *bagTrack* folder there is another folder, *javascript*, that contains all the scripts that allow interaction with the ledger  
Each of these scripts must be run from the shell  

`node script.js (arg1) (arg2) ...`

`invoke.js` is necessary to invoke this script every time a change is made to the ledger. No parameters required  

`addBag.js` Allows you to add an object to the ledger. Requires the baggage ID, flight ID and owner
  >`node addBag.js bag002 ab123 cde456`  
  
  
`enrollAdmin.js` This command stores the CA administrator credentials in the wallet directory. You can find the admin certificate and private key in the  `wallet` folder


`package-lock.json` Identifies the exact versions installed


`package.json` Identifies the packages to download and their exact versions by examining the “dependencies” section of the file.

`query.js` Returns only one of the objects contained in the ledger. It requires only the baggage ID  
>`node qyery.js bag002`

`queryAll.js` Returns all the objects contained in the ledger. No parameters required

`registerUser.js` This command stores the CA appUser credentials in the wallet directory. You can find the admin certificate and private key in the  `wallet` folder

`removeBag.js` Remove only one of the objects contained in the ledger. It requires only the baggage ID
>`node removeBag.js bag002`





### chaincode
**chaincode** contains **baggage chaincode** in JavaScript 
The important file is baggage.js located in `chaincode/baggage/javascript/lib/`  
this is the real chaincode

