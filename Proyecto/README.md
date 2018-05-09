# Proyecto Bases de Datos Avanzadas
## **Aplicación Web: Restaurante " Mi Comidita "**
##### *Luis Barajas Pérez - A01370934 , Mauricio Rico Zavala - A01370874 y Daniel Tapia A01022285*
###### 09 - 05 - 18
---
### Manual de Instalación:
1. Clonar el repositorio
    - Copiar el link de Clone or download
    - Dirigirse a la terminal, entrar al folder en el cual se desea tener la aplicación y correr el comando:
        - `$ git clone (link)`
2. Correr en la terminal los siguiente comandos:
     `$ docker-compose up --build`
3. En otra terminal ejecutamos los siguientes comandos:
    1. `$ docker-compose run website rails neo4j:migrate`
    2. `$ docker-compose run website rails neo4j:seed`
    3. `$ docker-compose run website bundle exec wheneverize`
### Manual de Usuario:
Una vez completados los pasos de Instalacion, podemos abrir la aplicacion en http://localhost:3000/ y la pantalla que debemos observar es la siguiente:
<br>

![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Dashboard.png "Dashboard")


En la imagen podemos observar nuestro Dashboard, en el cual tenemos la informacion de nuestro Restaurante, podemos observar, las recetas, los ingredientes,y los productos que vendemos; asi como un par de avisos que nos informan sobre los elementos que estan prontos a expirar, para que tomemos las medidas pertinentes; podemos ver  que en el lado izquierdo contamos con 4 Opciones, las cuales son **Dashboard** (En la cual estamos) **Raws**, **Recipes** y **Products**. Y en la parte inferior podemos observar nuestro inventorio actual,acompañado de un filtro de resultados, asi como realizar una busqueda en caso de ser necesaria. Y si descendemos aun mas, encontramos una serie de graficas que nos permiten evaluar y observar el desempeño de nuestro restaurante.


![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Graphs.png "Graphs")


Asi mismo, en este menu principal, podemos realizar nuevos registros, ya sea de:
<br>

**Raw**
![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Raw.png "Raw")

<br>
**Recipe**
<br>

![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Recipe.png "Recipe")
<br>

**Product**
<br>

![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Product.png "Product")
<br>

Y cada uno de estos registros esfecifican los elementos que son necesarios para realizar el registro.
Finalmente, en la pagina principal podemos acceder a cualquiera de las opciones previamente enlistadas y obtener los siguientes resultados:

![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Raws.png "Raws")

![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Recipes.png "Recipes")

![alt text](https://github.com/luisbarajasp/Restaurante-MiComidita/blob/master/img/Products.png "Products")

<br>
Es importante recalcar, que cada uno cuenta con la opcion de expandir, para ver mayores detalles, como los ingredientes y cantidades necesarias o bien costos y fechas de expiracion, asi como saber que cada una de estas entradas o registros cuentan con la opcion de editar o bien de ser eliminadas si es necesario

<br>

### Descripción trabajo realizado:

&nbsp;&nbsp;&nbsp;&nbsp; Para llevar a cabo este proyecto, se le requirió al equipo construir una aplicación web de cualquier tipo en la que se pudiera utilizar la plataforma de bases de datos en forma de grafos de Neo4j. En nuestro equipo decidimos implementar esta herramienta de bases de datos con una aplicación web construida en Ruby on Rails. Poder desarrollar una aplicación en Rails nos permite establecer el back-end de la apliación de una manera más sencilla e integrar la logísitica de Neo4j directamente al app. Es importante considerar que mucho del trabajo que se tiene que hacer para organizar una base de datos de Neo4j es arreglado por el framework de la aplicación entonces la organización entre pantalla e información de la base.
&nbsp;&nbsp;&nbsp;&nbsp; El principal trabajo realizado para la aplicación es organizar la relación entre los requests que los usuarios harán mediante las herramientas de la aplicación a nuestra base de datos Neo4j.


<!-- ###### Database
This application uses Neo4j to power the database. The local instance for the database has to be listening in the port 7474 of your localhost. Also you will have to run the `$ bundle exec figaro install` command in order to generate the application.yml file, necessary for your private login username and password. After running it go to config/application.yml and configure the `DB_USERNAME: "(your username here)"` and the `DB_PASSWORD: "(your password here)"` variables. -->
