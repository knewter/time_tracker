Feature: Dynamic Ticket Picker
  In order to create a new work unit
  A user
  wants to be able to choose a ticket dynamically

  @javascript
  Scenario: Pick a ticket
    Given a client "test client" exists with name: "test client"
    And a project "test project" exists with name: "test project", client: client "test client"
    And a ticket "test ticket" exists with project: project "test project", name: "test ticket"
    And I am on the ticket picker page
    When I select "test client" from "client_id"
    And I select "test project" from "project_id"
    Then I should see "test ticket" within "#tickets"
