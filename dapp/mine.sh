#!/bin/sh
cp -r /workspace/dapp/miner/data/keystore/* ~/data/keystore/
geth -datadir ~/data/ --networkid 88 --rpc --rpcaddr "172.18.0.50" --rpcapi admin,eth,miner,web3,personal,net,txpool --etherbase "4c49b59eb279ad53958b6580e16190b92034e71b" --allow-insecure-unlock console
