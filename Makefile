ENV_FILE = hadoop.env

build:
	docker build -t hadoop-namenode ./namenode
	docker build -t hadoop-datanode ./datanode
	docker build -t hadoop-resourcemanager ./resourcemanager
	docker build -t hadoop-nodemanager ./nodemanager
	docker build -t hadoop-historyserver ./historyserver

run:
	docker-compose up -d

stop:
	docker-compose down

clean:
	docker image rm hadoop-namenode hadoop-datanode hadoop-resourcemanager \
	hadoop-nodemanager hadoop-historyserver
