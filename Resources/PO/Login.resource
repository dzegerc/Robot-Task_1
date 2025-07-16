*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables.resource

*** Keywords ***
Login User 
    [Arguments]     ${EmailAddress}    ${Password}
    Fill "EmailAddress" field    ${EmailAddress}
    Fill "Password" Field        ${Password}
    Click "Login" Button




Fill "EmailAddress" field
    [Arguments]    ${email}
    Input Text      ${EMAIL_INPUT_LOGIN}    ${email}

Fill "Password" Field
    [Arguments]    ${password}
    Input Text      ${PASSWORD_INPUT_LOGIN}    ${password}
    
Click "Login" Button
    Wait Until Element Is Enabled    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}

    
