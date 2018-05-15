
#!/bin/bash -e




echo "Building channel for xcchannel" 

. setpeer.sh Org1 peer0
export CHANNEL_NAME="xcchannel"
peer channel create -o orderer.onenet:7050 -c $CHANNEL_NAME -f ./xcchannel.tx --tls true --cafile $ORDERER_CA -t 10000


. setpeer.sh Org1 peer0
export CHANNEL_NAME="xcchannel"
peer channel join -b $CHANNEL_NAME.block

