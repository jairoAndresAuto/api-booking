Feature: Dado que se encuentra la funcionalidad de eliminar booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Y despues se elimina el booking previamente creado
  Entonces validamos que se elimine el booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate-conf.js')
    * def tokenM = "Basic YWRtaW4eetttc3dvcmQxMjM="

  Scenario: Delete booking
    * call read("../create/post-booking.feature@Create")
    * call read("../token/crear-token.feature@token")
    * def tokenObtenido = "token=" + token
    Given url config.urlBase + "/booking"
    And  path idBooking
    And headers {'Cookie':'#(tokenObtenido)','Content-Type':'application/json','Accept':'application/json'}
    When method delete
    Then status 201
    * print response

  Scenario: Delete booking not found
    * call read("../token/crear-token.feature@token")
    * def tokenObtenido = "token=" + token
    Given url config.urlBase + "/booking"
    And path '99999'
    And headers {'Cookie':'#(tokenObtenido)','Content-Type':'application/json','Accept':'application/json'}
    When method delete
    Then status 405
    * print response

  Scenario: Delete booking token invalido
    * call read("../create/post-booking.feature@Create")
    Given url config.urlBase + "/booking"
    And  path idBooking
    And headers {'Cookie':'#(tokenM)','Content-Type':'application/json','Accept':'application/json'}
    When method delete
    Then status 403
    * print response