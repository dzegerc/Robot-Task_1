*** Settings ***
Library    SeleniumLibrary
Resource    ./SignupKeyword.resource
Resource    ../../Common/CommonKeywords.resource

*** Keywords ***
Input Name Element
    [Arguments]       ${name}
    Input Text Element                 ${NAME_INPUT_SIGNUP}     ${name}

Input EmailAddress Element
    [Arguments]       ${emailAddress}
    Input Text Element                 ${EMAIL_INPUT_SIGNUP}    ${emailAddress}



   
