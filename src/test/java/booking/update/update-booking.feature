Feature: Dado que se encuentra la funcionalidad de obtener booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Y despues se actualiza el booking previamente creado
  Entonces validamos que se actualiza el booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate.conf.js')
    * def Data = Java.type('booking.utilidad.Data')
    * def random = new Data()
    * def randomFirstName = random.generateRandomFirstName()
    * def randomLastName = random.generateRandomLastName()
    * def randomInteger = random.generateRandomInt()

  Scenario: Delete booking successfull
    * call read("../create/post-booking.feature@Create")
    Given url config.urlBase
    And path idBooking
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Authorization  = "Basic YWRtaW46cGFzc3dvcmQxMjM="
    And request {"firstname":"#(randomFirstName)","lastname":"#(randomLastName)","totalprice":#(randomInteger),"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method put
    Then status 200
    * print response

  Scenario: Delete booking no existente
    Given url config.urlBase
    And path '99999'
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Authorization  = "Basic YWRtaW46cGFzc3dvcmQxMjM="
    And request {"firstname":"#(randomFirstName)","lastname":"#(randomLastName)","totalprice":#(randomInteger),"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method put
    Then status 405
    * print response