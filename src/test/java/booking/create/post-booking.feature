Feature: Dado que se encuentra la funcionalidad de crear booking
  Cuando se en hace el llamado a la funcion post y se envian los datos
  Entonces validamos que se creen un booking de forma correcta

  Background:
    * def config = karate.call('classpath:karate.conf.js')

  @Create
  Scenario: create bookings
    Given url config.urlBase
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And request {"firstname":"Jim","lastname":"Brown","totalprice":111,"depositpaid":true,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method post
    Then status 200
    And def idBooking = $.bookingid
    * print response