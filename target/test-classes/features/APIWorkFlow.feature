Feature: API Testing

  Background:
    Given a JWT bearer token is generated

  @API
  Scenario: creating an employee
    Given a request is prepared for creating an employee
    When a Post call is made to create the employee
    Then the status code will be 201 for this call
    And the employee created contains key "Message" and value "Employee Created"
    And the employee id "Employee.employee_id" is stored as a global variable

  @API
  Scenario: Retrieving recently created employee
    Given a request is prepared for retrieving an employee
    When a GET call is made to get the employee
    Then the status code for this will be 200
    And the employee id we got "employee.employee_id" must match with global id
    And the received data from "employee" object matches with the data we used to create employee
      | emp_firstname | emp_lastname | emp_middle_name | emp_birthday | emp_gender | emp_job_title | emp_status |
      | barkat        | milad        | milad           | 1990-07-01   | Female     | QA Tester    | part time  |


@jsonPayLoad
Scenario: Creating employee using json payload
  Given a request is prepared for creating an employee using json payload
  When a Post call is made to create the employee
  Then the status code will be 201 for this call
  And the employee created contains key "Message" and value "Employee Created"
  And the employee id "Employee.employee_id" is stored as a global variable

  @dynamic
  Scenario: Create employee using json dynamic payload
    Given a request is prepared for creating an employee using json payload dynamic "manal" , "premium" , "ms" , "F" , "1976-06-16" , "permanent" , "QA Manager"
    When a Post call is made to create the employee
    Then the status code will be 201 for this call
    And the employee created contains key "Message" and value "Employee Created"
    And the employee id "Employee.employee_id" is stored as a global variable