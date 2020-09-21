#!/bin/bash
#

# js
export MSYS_NO_PATHCONV=1
starttime=$(date +%s)
CC_SRC_LANGUAGE=${1:-"javascript"}
CC_SRC_LANGUAGE=`echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:]`

if [ "$CC_SRC_LANGUAGE" = "javascript" ]; then
	CC_SRC_PATH="../chaincode/fabcar/javascript/"
else
	echo The chaincode language ${CC_SRC_LANGUAGE} is not supported by this script
	echo Supported chaincode language are: go, java, javascript, and typescript
	exit 1
fi

# pulisce vecchie sessioni
rm -rf javascript/wallet/*


# launch network; create channel and join peer to channel
pushd ../network
./network.sh down
./network.sh up createChannel -ca -s couchdb
./network.sh deployCC -ccn baggage -ccv 1 -cci initLedger -ccl ${CC_SRC_LANGUAGE} -ccp ${CC_SRC_PATH}
popd

#si sposta dentro javascript
cd javascript

#installa npm altrimenti lo aggiorna 
npm install

#esegue il comando di enrollAdmin e di registerUser
node enrollAdmin.js 
node registerUser.js