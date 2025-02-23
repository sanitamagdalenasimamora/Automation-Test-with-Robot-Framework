*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObject/OrderPage.robot

Test Setup       Login Application
Test Teardown    Close Browser

*** Test Cases ***
Order_1: Success Checkout 1 Product
    Given Add Product "Sauce Labs Backpack" to The Cart
    When Direct to Cart Page
    And Proceeds to Checkout
    And Input Personal Information Firstname: "Sanita" , Lastname: "Tiffany" , and Postal Code: "1231"
    And Display Checkout Overview
    Then Successfully Make a Payment

Order_2: Success Checkout More than 1 Product
    Given Add Product "Sauce Labs Backpack" and "Sauce Labs Bolt T-Shirt" to The Cart
    When Direct to Cart Page
    And Proceeds to Checkout
    And Input Personal Information Firstname: "Sanita" , Lastname: "Tiffany" , and Postal Code: "1231"
    And Display Checkout Overview
    Then Successfully Make a Payment