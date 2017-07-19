DOCKER_NETWORK = hadoop
ENV_FILE = ./hadoop.env

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.0-hadoop2.8-java8 hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.0-hadoop2.8-java8 hdfs dfs -copyFromLocal /opt/hadoop-2.8.0/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.0-hadoop2.8-java8 hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.0-hadoop2.8-java8 hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:1.2.0-hadoop2.8-java8 hdfs dfs -rm -r /input

build-local-base:
	docker build -t bde2020/hadoop-base:1.2.0-hadoop2.8-java8 ./base
