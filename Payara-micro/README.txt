CREAR IMAGEN

	docker build -t payaramicrotpi:IR13002 .

CORRER
	
	docker run --rm -p 4848:4848 8080:8080 --name microtpi  -d payaramicrotpi:IR13002 bin/asadmin start-domain -v
