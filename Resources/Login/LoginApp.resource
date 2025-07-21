*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/EmailAndPasswordForm.resource
Resource    ./PO/LoginClickElement.resource


*** Variables ***
${INCORRECT_MESSAGE} =    xpath=//*[@id="form"]/div/div/div[1]/div/form/p
${VERIFY_LOGIN_TEXT} =           xpath=//*[@id="form"]/div/div/div[1]/div/h2


*** Keywords ***
Submit Valid Login Data
    [Arguments]    ${user}
    Input Valid Email and Password Data    ${user["EMAIL"]}    ${user["PASSWORD"]}
    Click Login Element


Input Valid Email and Password Data
    [Arguments]      ${emailAddress}     ${password}
    EmailAndPasswordForm.Input EmailAddress Element     ${emailAddress}  
    EmailAndPasswordForm.Input Password Element        ${password}


Skip Email or/and Password Field from Login page
    [Documentation]      Checking required fields for entering email address and password
    [Arguments]     ${user}    ${skip_field}=NONE
    Run Keyword If    '${user["EMAIL"]}' !=''       EmailAndPasswordForm.Input EmailAddress Element     ${user["EMAIL"]}
    Run Keyword If    '${user["PASSWORD"]}' !=''    Input Password Element         ${user["PASSWORD"]}           

Checking Keeps the User on the Current Page
    Wait Until Element Is Enabled    ${VERIFY_LOGIN_TEXT}
    
Input Invalid Login Credentials
    [Documentation]    Check login page using invalid email and/or password
    [Arguments]    ${email}=wrong@example.com    ${password}=wrongpass123
    EmailAndPasswordForm.Input EmailAddress Element    ${email}
    Input Password Element                             ${password}

Verify Login Error Message Is Displayed
    Wait Until Element Is Enabled    ${INCORRECT_MESSAGE}




    