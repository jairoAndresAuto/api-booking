Feature: Get booking

  Scenario: Get booking
    Given url "https://restful-booker.herokuapp.com/booking"
    And path "3"
    And header Accept = "application/json"
    When method get
    Then status 200
    * print response