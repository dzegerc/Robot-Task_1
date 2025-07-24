*** Settings ***
Library    SeleniumLibrary
Resource    ../../Common/CommonKeywords.resource


*** Variables ***
${EMAIL_INPUT_LOGIN} =           xpath=//form[@action='/login']//input[@name='email']
${PASSWORD_INPUT_LOGIN} =        xpath=//form[@action='/login']//input[@name='password']


*** Keywords ***
Input EmailAddress Element
    [Arguments]           ${emailAddress}
    Input Text Element    ${EMAIL_INPUT_LOGIN}       ${emailAddress}
    
Input Password Element
    [Arguments]           ${password}
    Input Text Element    ${PASSWORD_INPUT_LOGIN}    ${password}    