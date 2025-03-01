Feature: Delete booking

  Scenario: Delete booking
    * call read("../create/post-booking.feature@Create")
    Given url "https://restful-booker.herokuapp.com/booking/" + idBooking
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Authorization  = "Basic YWRtaW46cGFzc3dvcmQxMjM="
    When method delete
    Then status 201
    * print response