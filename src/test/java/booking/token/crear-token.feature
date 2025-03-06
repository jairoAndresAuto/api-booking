Feature: Crear token

  Background:
    * def config = karate.call('classpath:karate-conf.js')
    * def datos = read('classpath:booking/token/request.json')

  @token
  Scenario: obtener token
    Given url config.urlBase + "/auth"
    And request datos
    When method post
    Then status 200
    And def token = $.token
    * print response