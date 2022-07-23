#!/bin/bash

curl -s -X POST \
  http://localhost:3000/channels/create \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"main-channel",
	"configPath":"../network/devchannel/channels/main-channel.tx"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/channels/create \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"allorgs-channel",
	"configPath":"../network/devchannel/channels/allorgs-channel.tx"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/channels/join \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"main-channel"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/channels/join \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"allorgs-channel"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/channels/join \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"Org1",
	"channel":"allorgs-channel"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/channels/join \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"Org2",
	"channel":"allorgs-channel"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/smartcontract/install \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"orgs":["MainOrg"],
	"channel":"main-channel",
	"chaincode":"get_document"
}'

echo
echo
sleep 1

// Execute this curl in terminal for install new smart contract in test_golang
curl -s -X POST \
  http://localhost:3000/smartcontract/install \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"orgs":["MainOrg", "Org1", "Org2"],
	"channel":"allorgs-channel",
	"chaincode":"test_golang"
}'

echo
echo
sleep 5

curl -s -X POST \
  http://localhost:3000/smartcontract/query \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"test_node",
	"function":"ping",
	"args":[]
}'

echo
echo
sleep 5

curl -s -X POST \
  http://localhost:3000/smartcontract/query \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"allorgs-channel",
	"chaincode":"test_golang",
	"function":"ping",
	"args":[]
}'


curl -s -X POST \
  http://localhost:3000/smartcontract/query \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"org":"MainOrg",
	"channel":"allorgs-channel",
	"chaincode":"test_golang",
	"function":"ping",
	"args":[]
}'

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Escritura",
		"ID":"ID1",
		"Rol":"0023-40"
	}]
}'

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Certificado de no expropiación",
		"ID":"ID2",
		"Rol":"0023-40"
	}]
}'

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Certificado de no expropiación municipal",
		"ID":"ID3",
		"Rol":"0023-40"
	}]
}'

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Certificado de número domiciliario",
		"ID":"ID4",
		"Rol":"0023-40"
	}]
}'

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Certificado de avalúo fiscal",
		"ID":"ID5",
		"Rol":"0023-40"
	}]
}'

# Restart Hyperledger Explorer now
docker-compose up -d