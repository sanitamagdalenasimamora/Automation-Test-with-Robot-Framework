*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObject/LoginPage.robot

Test Setup       Open Application
Test Teardown    Close Browser

*** Test Cases ***
Login_1: Success Login
    Given Display Login Page
    When Input "standard_user" and "secret_sauce"
    Then Display Dashboard

Login_2: Login with Locked Out User
    Given Display Login Page
    When Input "locked_out_user" and "secret_sauce"
    Then Display Error Message

Login_3: Login with Problem User
    Given Display Login Page
    When Input "problem_user" and "secret_sauce"
    Then Display Failed Content

Login_4: Failed Login when Username: Null
    Given Display Login Page
    When Input "" and "secret_sauce"
    Then Display Validation "Epic sadface: Username is required"

Login_5: Failed Login when Password: Null
    Given Display Login Page
    When Input "standard_user" and ""
    Then Display Validation "Epic sadface: Password is required"

