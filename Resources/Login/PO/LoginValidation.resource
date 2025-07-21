*** Settings *** 
Library    SeleniumLibrary
Resource    ../../Signup/SignupApp.resource
Resource    ../LoginApp.resource

*** Keywords ***

Required Login Fields
    [Arguments]    ${user}
    FOR    ${field}    IN    @{REQUIRED_FIELDS}
        Validate Empty Login Fields   ${user}   ${field}
    END

