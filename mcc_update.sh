#!/bin/bash
if [[ ! -z "$1" ]]; then  
	. setpeer.sh Org1 peer0 
export CHANNEL_NAME="xcchannel"
	peer chaincode install -n mcc -v $1 -p github.com/mcc
	peer chaincode upgrade -o orderer.onenet:7050 --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C xcchannel -n mcc -v $1 -c '{"Args":["init",""]}' -P " OR( 'Org1MSP.member' ) " 
else
	echo ". mcc_updchain.sh  <Version Number>" 
fi
