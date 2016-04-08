Feature:
  In order to manage a collection of muffins,
  As a muffin collection manager,
  I would like to exercise the muffin REST API

  Background:
    Given the muffin application is running


  Scenario: I would like to be able to determine if the application is running
    When I check the muffin API status
    Then I should receive a successful result

  Scenario: I would like to be able to create a muffin
    When I create a muffin
    Then I should receive a successful result

  @test
  Scenario: I receive an error when attempting to use an invalid muffin id
    When I try to get a muffin with an invalid id
    Then I receive an error 400 bad muffin request

#  Scenario: I receive an error when attempting to get a nonexistent muffin
#    When I try to get a nonexistent muffin
#    Then I receive a 404 muffin does not exist error

  Scenario Outline: I want to create different types of muffins
    When <purchaser> buys a <type> muffin for <owner>
    Then I should receive a successful result
    Examples:
      | type           | owner  | purchaser |
      | pistachio      | brian  | alain     |
      | chocolate chip | grant  | alain     |
      | strawberry     | dustin | dustin    |
      | tartberry      | lulu   | alain     |










