#!/bin/bash
. setpeer.sh Org1 peer0 
export CHANNEL_NAME="xcchannel"
peer chaincode install -n mcc -v 1.0 -p github.com/mcc
peer chaincode instantiate -o orderer.onenet:7050 --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C xcchannel -n mcc -v 1.0 -c '{"Args":["init","hello"]}' -P " OR( 'Org1MSP.member' ) " 
