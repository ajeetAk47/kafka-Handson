# Kafka-Connect-Handson

`docker run --rm -it --net=host landoop/fast-data-dev bash`

### To install jq to pretty print json
`apk update && apk add jq`

# Rest Connect Rest API
### Get Worker Information
`curl -s 127.0.0.1:8083/ | jq`
### List of available Connectors on a Worker
`curl -s 127.0.0.1:8083/connector-plugins | jq`
### Acitve Connectors
`curl -s 127.0.0.1:8083/connectors | jq`
### Get Information about a Connector Tasks and Config
`curl -s 127.0.0.1:8083/connectors/connector-name/tasks | jq`
### Get Connector Status
`curl -s 127.0.0.1:8083/connectors/connector-name/status | jq`
### Pause / Resume a Connector
`curl -s 127.0.0.1:8083/connectors/connector-name/pause`
####
`curl -s 127.0.0.1:8083/connectors/connector-name/resume`
### Delete Connector 
`curl -s -X DELETE 127.0.0.1:8083/connectors/connector-name`
### Create a new Connector
`curl -s -X POST -H 'Content-Type: application/json' -d '{ "name": "source-twitter-distributed","config": { "connector.class": "com.eneco.trading.kafka.connect.twitter.TwitterSourceConnector","tasks.max": "1","topic": "twitter-distributed","key.converter": "org.apache.kafka.connect.json.JsonConverter","key.converter.schemas.enable": "true","value.converter": "org.apache.kafka.connect.json.JsonConverter","value.converter.schemas.enable": "true",    "twitter.consumerkey": "consumerkey","twitter.consumersecret": "consumersecret","twitter.token": "token","twitter.secret": "secret-key","track.terms": "web,javascript","language": "en" }}' 127.0.0.1:8083/connectors | jq`
### Update Connector Configuration
`curl -s -X PUT -H 'Content-Type: application/json' -d '{ "connector.class": "com.eneco.trading.kafka.connect.twitter.TwitterSourceConnector","tasks.max": "1","topic": "twitter-distributed","key.converter": "org.apache.kafka.connect.json.JsonConverter","key.converter.schemas.enable": "true","value.converter": "org.apache.kafka.connect.json.JsonConverter","value.converter.schemas.enable": "true",    "twitter.consumerkey": "consumerkey","twitter.consumersecret": "consumersecret","twitter.token": "token","twitter.secret": "secret-key","track.terms": "web,javascript","language": "en" }' 127.0.0.1:8083/connectors/connector-name/config | jq`

