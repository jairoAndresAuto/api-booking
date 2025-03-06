Feature: Dado que se encuentra la funcionalidad de crear booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Entonces validamos que se creen un booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate-conf.js')
    * def Data = Java.type('booking.utilidad.Data')
    * def random = new Data()
    * def randomFirstName = random.generateRandomFirstName()
    * def randomLastName = random.generateRandomLastName()
    * def randomInteger = random.generateRandomInt()
    * def datos = read('classpath:booking/estructura/estructura.json')

  @Create
  Scenario: create bookings
    Given url config.urlBase + "/booking"
    And headers {'Content-Type':'application/json','Accept':'application/json'}
    And request {"firstname":"#(randomFirstName)","lastname":"#(randomLastName)","totalprice":#(randomInteger),"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method post
    Then status 200
    And def idBooking = $.bookingid
    And match $ == datos
    * print response