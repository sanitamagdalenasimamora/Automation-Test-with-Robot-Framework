*** Settings ***
Library    SeleniumLibrary
Resource  ../MasterData/MainData.robot

*** Variables ***
${browser}        chrome
${url}           https://www.saucedemo.com/

*** Keywords ***
Login Application
    Open Browser    ${url}    ${browser}
    Wait Until Element Is Visible    ${login_button}
    Input Text    ${username_field}    standard_user
    Input Text    ${password_field}    secret_sauce
    Click Button    ${login_button}
    Wait Until Element Is Visible    ${title}

Add Product "${product_name}" to The Cart
    Click Button    xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button
    
Add Product "${product_name1}" and "${product_name2}" to The Cart
    Click Button    xpath=//div[text()='${product_name1}']/ancestor::div[@class='inventory_item']//button
    Click Button    xpath=//div[text()='${product_name2}']/ancestor::div[@class='inventory_item']//button

Direct to Cart Page
    Click Element    ${cart_icon}
    Wait Until Element Is Visible    ${checkout_button}

Proceeds to Checkout
    Click Button    ${checkout_button}
    Wait Until Element Is Visible    xpath://span[contains(text(), "Checkout: Your Information")]

Input Personal Information Firstname: "${firstname}" , Lastname: "${lastname}" , and Postal Code: "${postalcode}"
    Input Text    ${firstname_field}    ${firstname}
    Input Text    ${lastname_field}    ${lastname}
    Input Text    ${postalcode_field}    ${postalcode}
    Click Button  ${continue_button}
    
Display Checkout Overview
    Wait Until Element Is Visible    xpath://span[contains(text(), "Checkout: Overview")]

Successfully Make a Payment
    Click Button    ${finish_button}
    Wait Until Element Is Visible    ${thankyou}

