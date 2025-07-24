*** Settings ***
Library     SeleniumLibrary
Resource    ../../Common/CommonKeywords.resource

*** Variables ***

${NAME_INPUT_SIGNUP} =           xpath=//input[@data-qa='signup-name']
${EMAIL_INPUT_SIGNUP} =          xpath=//input[@data-qa='signup-email']

*** Keywords ***
Input Name Element
    [Arguments]        ${name}
    Input Text Element                  ${NAME_INPUT_SIGNUP}      ${name}

Input EmailAddress Element
    [Arguments]        ${emailAddress}
    Input Text Element                  ${EMAIL_INPUT_SIGNUP}     ${emailAddress}



   
