echo "Bootnodes: $BOOTNODES";

geth \
  --datadir /usr/starchain/data \
  --networkid 1578 \
  --mainnet \
  --port 30303 \
  --syncmode snap \
  --cache 2048 \
  --http \
  --http.api personal,eth,net,web3,txpool,debug,congress,trace \
  --http.corsdomain "*" \
  --http.addr 0.0.0.0 \
  --http.vhosts "*" \
  --ws \
  --ws.port 3334 \
  --ws.api eth,net,web3 \
  --ws.origins '*' \
  --ws.addr 0.0.0.0 \
  --miner.gasprice 320000000000 \
  --bootnodes ${BOOTNODES}