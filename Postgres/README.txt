Compilar la imagen 
	docker build  -t postgrestpi:IR13002 .

Correr contenedor
	docker run --rm -it --name pgtpi -p 5430:5430 -d postgrestpi:IR13002

Ver errores del contenedor
	docker logs -f cointername
