*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test


*** Variables ***
@{REQUIRED_FIELDS}    EMAIL    PASSWORD 
           


*** Test Cases ***
Validate Login Page with Empty Fields
    [Documentation]    Checking required fileds from first page of signup page
    [Tags]    negativ test: email empty address field    negativ test: password empty field
    Go To Signup/Login page
    FOR    ${field}    IN    @{REQUIRED_FIELDS}
        Log    ${user}    level=DEBUG  
        ${user_copy}=    Copy Dictionary    ${user}
        Set To Dictionary    ${user_copy}    ${field}        ${EMPTY}
        Skip Email or/and Password Field from Login page     ${user_copy}
        Click Login Element
        Sleep    2s
        Checking Keeps the User on the Current Page
        Reload Page
    END
    
Validate Login Page with Incorrect Email and Password
    [Tags]    negativ test: login validation
    Go To Signup/Login page
    Input Invalid Login Credentials
    Click Login Element
    Verify Login Error Message Is Displayed
