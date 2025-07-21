*** Settings *** 
Library    SeleniumLibrary
Resource    ../SignupApp.resource

*** Keywords ***
Prepare Signup Detail Page With Valid User
    [Arguments]    ${user}
    Go To Signup/Login page
    Submit Signup Form with Valid Data    ${user}
    User Redirected to Signup Detail Page

 Required Fields And Validate Missing
    [Arguments]    ${user}
    FOR    ${field}    IN    @{REQUIRED_FIELDS}
        Validate Missing Field In Signup Detail Form    ${user}    ${field}
    END

Required Fields From First Step
    [Arguments]    ${user}
    FOR    ${field}    IN    @{REQUIRED_FIELDS_FIRST_STEP}
        Validate Missing Field In First Step    ${user}    ${field}
    END