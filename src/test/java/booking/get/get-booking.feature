Feature: Dado que se encuentra la funcionalidad de obtener booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Y despues se consulta el booking previamente creado
  Entonces validamos que se consulte el booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate.conf.js')

  Scenario: Get booking sucessfull
    * call read("../create/post-booking.feature@Create")
    Given url config.urlBase + "/booking"
    And path idBooking
    And header Accept = "application/json"
    When method get
    Then status 200
    * print response

  Scenario: Get booking not found
    Given url config.urlBase + "/booking"
    And path '99999'
    And header Accept = "application/json"
    When method get
    Then status 404
    * print response