DOCKER_NETWORK = hadoop
ENV_FILE = ./hadoop.env

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -copyFromLocal /opt/hadoop-2.8.0/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -rm -r /input

build-local:
	docker build -t bde2020/hadoop-base:1.2.1-hadoop2.8-java8 ./base
	docker build -t bde2020/hadoop-namenode:1.2.1-hadoop2.8-java8 ./namenode
	docker build -t bde2020/hadoop-datanode:1.2.1-hadoop2.8-java8 ./datanode
	docker build -t bde2020/hadoop-nodemanager:1.2.1-hadoop2.8-java8 ./nodemanager
	docker build -t bde2020/hadoop-resourcemanager:1.2.1-hadoop2.8-java8 ./resourcemanager
	docker build -t bde2020/hadoop-historyserver:1.2.1-hadoop2.8-java8 ./historyserver
