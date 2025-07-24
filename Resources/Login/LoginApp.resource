*** Settings ***
Library     SeleniumLibrary
Resource    ./PO/EmailAndPasswordForm.resource
Resource    ./PO/LoginApp_PO.resource
Resource    ../Signup/GenerateUserData.resource

*** Variables ***
${INCORRECT_MESSAGE} =    xpath=//*[@id="form"]/div/div/div[1]/div/form/p
@{REQUIRED_FIELDS}    EMAIL    PASSWORD 
#test data
${VALID_EMAIL}=    edvin@edvin.com
${VALID_PASSWORD}=    123


*** Keywords ***
Submit Valid Login Data
    [Arguments]          ${user}
    Input Valid Email and Password Data                  ${user["EMAIL"]}    ${user["PASSWORD"]}
    LoginApp_PO.Click Login Element
    LoginApp_PO.Checking If The User Is Logged In


Input Valid Email and Password Data
    [Arguments]          ${emailAddress}     ${password}
    EmailAndPasswordForm.Input EmailAddress Element      ${emailAddress}  
    EmailAndPasswordForm.Input Password Element          ${password}

Validate Empty Login Fields
    [Arguments]          ${user}    ${field}
    ${user_copy}=    Copy Dictionary                     ${user}
    Set To Dictionary    ${user_copy}    ${field}        ${EMPTY}
    Fill Login Form With Optional Fields                 ${user_copy}
    LoginApp_PO.Click Login Element
    Sleep    2s
    LoginApp_PO.Checking If Keeps The User On The Current Login Page
    Reload Page


Fill Login Form With Optional Fields
    [Documentation]      Checking required fields for entering email address and password
    [Arguments]        ${user} 
    Run Keyword If    '${user["EMAIL"]}' !=''       EmailAndPasswordForm.Input EmailAddress Element     ${user["EMAIL"]}
    Run Keyword If    '${user["PASSWORD"]}' !=''    EmailAndPasswordForm.Input Password Element         ${user["PASSWORD"]}           


    
Input Invalid Login Credentials
    [Documentation]    Check login page using invalid email and/or password
    [Arguments]          ${email}=wrong@example.com    ${password}=wrongpass123
    EmailAndPasswordForm.Input EmailAddress Element    ${email}
    Input Password Element                             ${password}


Verify Login Error Message Is Displayed
    Wait Until Element Is Enabled    ${INCORRECT_MESSAGE}
    [Arguments]    ${user}
    FOR            ${field}    IN    @{REQUIRED_FIELDS}
        Validate Empty Login Fields  ${user}   ${field}
    END

Login Process With Exist User 
    Input Valid Email and Password Data    ${VALID_EMAIL}    ${VALID_PASSWORD}
    LoginApp_PO.Click Login Element



    