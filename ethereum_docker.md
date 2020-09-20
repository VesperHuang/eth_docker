###  ethereum image
```
docker pull ethereum/client-go
```

### build docker network
```
docker network create -d bridge --subnet=172.18.0.0/16 ethnet
docker network ls
```

### console
```
docker run -it --rm -v c://workspace:/workspace --entrypoint /bin/sh ethereum/client-go
```

### create new account
```
cd /workspace/dapp/miner
geth -datadir ./data account new
```

### miner console
```
docker run -it --name=miner --network ethnet --ip 172.18.0.50 --hostname node -v c://workspace/docker/:/workspace/ --entrypoint /bin/sh ethereum/client-go
```

### miner
```
docker run -it --name=miner --network ethnet --ip 172.18.0.50 --hostname node -v c://workspace/docker/:/workspace/ --entrypoint /workspace/dapp/init.sh ethereum/client-go /workspace/dapp/mine.sh 
```

### node
```
//node 1
docker run -it --name=node1 --network ethnet --ip 172.18.0.51 --hostname node1 -v c://workspace/docker:/workspace --entrypoint /workspace/dapp/init.sh ethereum/client-go /workspace/dapp/node.sh

//node 2
docker run -it --name=node2 --network ethnet --ip 172.18.0.52 --hostname node1 -v c://workspace/docker:/workspace --entrypoint /workspace/dapp/init.sh ethereum/client-go /workspace/dapp/node.sh
```

### run dockerfile for truffle
```
docker build -f Dockerfile -t truffle_dev:0.1 .
```

### truffle
```
docker run -it --rm -v c://workspace/docker:/workspace --network ethnet truffle_dev:0.1
```

### node test -- RPC
```
curl 172.18.0.50:8545 -X POST --data '{"id":1,"jsonrpc":"2.0","method":"eth_accounts", "params":[]}' -H "Content-Type: application/json"

curl 172.18.0.50:8545 -X POST --data '{"id":1,"jsonrpc":"2.0","method":"eth_getBalance", "params":["0x7cb7a6e3eea63258864a6d51cde7e865949c60b1","latest"]}' -H "Content-Type: application/json"
```

### truffle unbox metacoin
```
truffle compile
truffle migrate

https://medium.com/@AndyHuang76/ethereum-dapp-%E9%96%8B%E7%99%BC%E7%92%B0%E5%A2%83%E5%AE%89%E8%A3%9D%E5%8F%8A%E8%A8%AD%E5%AE%9A-cc5172f0b9cb
```

### memo
```
Ganache 是一個本地的 ethereum 模擬器，或叫仿真器。主要的功能，就是本地運行一個 ethereum 的模擬環境，不需要挖礦，不需要再安裝 ethereum 客戶端。

Truffle suite 有三個主角，Truffle 、Ganache 、Drizzle

personal.unlockAccount(eth.accounts[0],"password")
```

