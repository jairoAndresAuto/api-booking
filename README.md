# Karate project using Cucumber 

01/03/2025

Karate Framework es una herramienta potente y fácil de usar para realizar pruebas automáticas sobre servicios web, especialmente APIs RESTful y SOAP. Ofrece una sintaxis clara y natural, ideal para equipos de desarrollo y pruebas, sin la necesidad de depender de extensos conocimientos de programación. Además, su integración con herramientas como Jenkins y su capacidad para generar datos dinámicos la hacen una opción popular para pruebas de integración y de rendimiento.

Durante este proyecto se crearon los metodos Pruebas para: GetBooking, CreateBooking, UpdateBooking, DeleteBooking. Cada uno de ellos tiene las siguientes caracteristicas Reusar features, escenario autosuficientes-desacoplados-independientes y usa paralelización. Adicional a ello esta integrado con la libreria de cucumber para mejorar el tema de la reporteria. 


### Prerequisites
* Java 17 installed
* Gradle  (Suggested version 7.5.1)
* IDE installed (Suggested IntelliJ IDEA 2022.2)
* Sourcetree
* Google Chrome installed

### Basic Commands

To run a specific Runner
`gradle clean test --tests=ManagerTest`

### Ejecucion manual agrupado o uno a uno

Para realizar la ejecucion manuel uno a uno dirigerse a la siguientes rutas:<br>
*[src/test/java/booking/create/post-booking.feature](src/test/java/booking/create/post-booking.feature) - Ejecutar el icono play y escoger la opcion Run 'Scenario: .....'<br>
*[src/test/java/booking/create/delete-booking.feature](src/test/java/booking/create/delete-booking.feature) - Ejecutar el icono play y escoger la opcion Run 'Scenario: .....'<br>
*[src/test/java/booking/create/get-booking.feature](src/test/java/booking/create/get-booking.feature) - Ejecutar el icono play y escoger la opcion Run 'Scenario: .....'<br>
*[src/test/java/booking/create/update-booking.feature](src/test/java/booking/create/update-booking.feature) - Ejecutar el icono play y escoger la opcion Run 'Scenario: .....'<br>

Para correr en grupo solamente es ejecutar el archivo:<br>
*[src/test/java/booking/ManagerTest.java](src/test/java/booking/ManagerTest.java) - Ir al metodo testParalell Ejecutar el icono play y escoger la opcion Run 'ManagerTest.testParalell'