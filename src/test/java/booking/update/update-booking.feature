Feature: Delete booking

  Scenario: Delete booking
    * call read("../create/post-booking.feature@Create")
    Given url "https://restful-booker.herokuapp.com/booking/" + idBooking
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Authorization  = "Basic YWRtaW46cGFzc3dvcmQxMjM="
    And request {"firstname":"Jairo","lastname":"Garcia","totalprice":333,"depositpaid":false,"bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},"additionalneeds":"Breakfast"}
    When method put
    Then status 200
    * print response