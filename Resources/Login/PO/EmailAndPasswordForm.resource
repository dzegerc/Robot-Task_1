*** Settings ***
Library    SeleniumLibrary
Resource    ../../Common/CommonKeywords.resource


*** Variables ***
${EMAIL_INPUT_LOGIN} =           xpath=//*[@id="form"]/div/div/div[1]/div/form/input[2]
${PASSWORD_INPUT_LOGIN} =        xpath=//*[@id="form"]/div/div/div[1]/div/form/input[3]


*** Keywords ***
Input EmailAddress Element
    [Arguments]       ${emailAddress}
    Input Text Element    ${EMAIL_INPUT_LOGIN}    ${emailAddress}
    
Input Password Element
    [Arguments]       ${password}
    Input Text Element    ${PASSWORD_INPUT_LOGIN}    ${password}    