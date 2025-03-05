Feature: Dado que se encuentra la funcionalidad de eliminar booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Y despues se elimina el booking previamente creado
  Entonces validamos que se elimine el booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate.conf.js')

  Scenario: Delete booking
    * call read("../create/post-booking.feature@Create")
    Given url config.urlBase
    And  path idBooking
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Authorization  = "Basic YWRtaW46cGFzc3dvcmQxMjM="
    When method delete
    Then status 201
    * print response

  Scenario: Delete booking not found
    Given url config.urlBase
    And path '99999'
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Authorization  = "Basic YWRtaW46cGFzc3dvcmQxMjM="
    When method delete
    Then status 405
    * print response