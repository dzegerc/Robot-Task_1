*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/EmailAndPasswordForm.resource
Resource    ./PO/LoginClickElement.resource


*** Variables ***


*** Keywords ***
Submit Valid Login Data
    [Arguments]    ${user}
    Input Valid Email and Password Data    ${user["EMAIL"]}    ${user["PASSWORD"]}
    Click Login Element


Input Valid Email and Password Data
    [Arguments]      ${emailAddress}     ${password}
    EmailAndPasswordForm.Input EmailAddress Element     ${emailAddress}  
    EmailAndPasswordForm.Input Password Element        ${password}







    