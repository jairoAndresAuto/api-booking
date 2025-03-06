Feature: Dado que se encuentra la funcionalidad de obtener booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Y despues se actualiza el booking previamente creado
  Entonces validamos que se actualiza el booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate-conf.js')
    * def Data = Java.type('booking.utilidad.Data')
    * def random = new Data()
    * def randomFirstName = random.generateRandomFirstName()
    * def randomLastName = random.generateRandomLastName()
    * def randomInteger = random.generateRandomInt()
    * def datos = read('classpath:booking/estructura/estructura.json')

  Scenario: Delete booking successfull
    * call read("../create/post-booking.feature@Create")
    * call read("../token/crear-token.feature@token")
    * def tokenObtenido = "token=" + token
    Given url config.urlBase + "/booking"
    And path idBooking
    And headers {'Cookie':'#(tokenObtenido)','Content-Type':'application/json','Accept':'application/json'}
    And request {"firstname":"#(randomFirstName)","lastname":"#(randomLastName)","totalprice":#(randomInteger),"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method put
    Then status 200
    And match $ == datos
    * print response

  Scenario: Delete booking no existente
    * call read("../token/crear-token.feature@token")
    * def tokenObtenido = "token=" + token
    Given url config.urlBase + "/booking"
    And path '99999'
    And headers {'Cookie':'#(tokenObtenido)','Content-Type':'application/json','Accept':'application/json'}
    And request {"firstname":"#(randomFirstName)","lastname":"#(randomLastName)","totalprice":#(randomInteger),"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method put
    Then status 405
    * print response