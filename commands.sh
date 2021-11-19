#!/bin/bash

# Start our kafka cluster
docker-compose up kafka-cluster

# Start our kafka cluster, elasticsearch, postgres
docker-compose up kafka-cluster elasticsearch postgres

# Docker force recreate 
docker-compose up -d --force-recreate --build

# we start a hosted tools
docker run --rm -it --name=kafka-commands --net=host landoop/fast-data-dev bash

# To Create Kafka Topics
kafka-topics --create --topic twitter-distributed --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181

# To Create Kakfa Consumer
kafka-console-consumer --topic twitter-distributed --from-beginning --bootstrap-server 127.0.0.1:9092

# Usage is connect-standalone worker.properties connector1.properties [connector2.properties connector3.properties]
connect-standalone worker.properties file-stream-demo-standalone.properties