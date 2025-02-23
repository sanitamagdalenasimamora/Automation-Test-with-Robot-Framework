*** Settings ***
Library    SeleniumLibrary
Resource  ../MasterData/MainData.robot

*** Variables ***
${browser}        chrome
${url}           https://www.saucedemo.com/

*** Keywords ***
Open Application
    Open Browser    ${url}    ${browser}
    Wait Until Element Is Visible    ${login_button}

Display Login Page
    Title Should Be    Swag Labs
    
Input "${username}" and "${password}"
    Input Text    ${username_field}    ${username}
    Input Text    ${password_field}    ${password}
    Click Button    ${login_button}

Display Dashboard
    Wait Until Element Is Visible    ${title}

Display Error message
    Wait Until Element Is Visible    ${error_message}
    
Display Failed Content
    Wait Until Element Is Visible    ${failed_content}

Display Validation "${message}"
    Wait Until Element Is Visible    xpath://h3[normalize-space()='${message}']