master:
	docker-compose up -d postgres-master

slave:
	docker-compose up -d postgres-master

start:
	docker-compose up -d

stop:
	docker-compose down