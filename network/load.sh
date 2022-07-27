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

curl -s -X POST \
  http://localhost:3000/smartcontract/install \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"orgs":["Org1", "Org2"],
	"channel":"allorgs-channel",
	"chaincode":"get_document"
}'

echo
echo
sleep 1

curl -s -X POST \
  http://localhost:3000/smartcontract/install \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d '{
	"orgs":["Org2"],
	"channel":"allorgs-channel",
	"chaincode":"generate_contract"
}'

echo
echo
sleep 5

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"MainOrg",
	"channel":"main-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Certificado de contribuciones",
		"Rol":"2020-10",
        "ID":"1",
        "Description":"Subido desde load.sh"
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
		"Document":"Certificado de expropiación",
		"Rol":"2020-10",
        "ID":"2",
        "Description":"Subido desde load.sh"
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
		"Document":"Certificado de recepción final",
		"Rol":"2020-10",
        "ID":"3",
        "Description":"Subido desde load.sh"
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
		"Document":"Certificado de aseo municipal",
		"Rol":"2020-10",
        "ID":"4",
        "Description":"Subido desde load.sh"
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
		"Rol":"2020-10",
        "ID":"5",
        "Description":"Subido desde load.sh"
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
		"Document":"Certificado de vivienda social",
		"Rol":"2020-10",
        "ID":"6",
        "Description":"Subido desde load.sh"
	}]
}'


curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"Org1",
	"channel":"allorgs-channel",
	"chaincode":"get_document",
	"function":"store",
	"args":[{
		"Document":"Certificado de número domiciliario",
		"Rol":"2020-11",
        "ID":"7",
        "Description":"Subido desde load.sh"
	}]
}'

curl --location --request POST 'http://localhost:3000/smartcontract/invoke' \
--header 'cache-control: no-cache' \
--header 'content-type: application/json' \
--data-raw '{
	"org":"Org2",
	"channel":"allorgs-channel",
	"chaincode":"generate_contract",
	"function":"store",
	"args":[{
		"Name":"Contrato 1",
		"Code":"2020-11",
        "Version":"v1"
	}]
}'
# Restart Hyperledger Explorer now
docker-compose up -d