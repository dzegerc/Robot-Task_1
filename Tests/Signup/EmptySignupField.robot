*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test


*** Variables ***
@{REQUIRED_FIELDS_FIRST_STEP}    NAME    EMAIL
@{REQUIRED_FIELDS}               PASSWORD    NAME     LASTNAME    ADDRESS    STATE    CITY    ZIPCODE    MOBILE


*** Test Cases ***
Validate First Step of Signup Page
    [Documentation]    Checking required fileds from first page of signup page
    [Tags]    Check: name    check: email address
    Go To Signup/Login page
    FOR    ${field}    IN    @{REQUIRED_FIELDS_FIRST_STEP}
        Log    ${user}    level=DEBUG  
        ${user_copy}=    Copy Dictionary    ${user}
        Set To Dictionary    ${user_copy}    ${field}     ${EMPTY}
        Skip Name or/and Email Field from Signup page     ${user_copy}
        Click Signup Element
        Sleep    2s
        Check the User not Redirect to Detail Page
        Reload Page
    END

User Cannot Register With Existing Email
        [Tags]    negative    validation    field:email
        Input Name Element                              ${user["NAME"]}
        NameAndEmailForm.Input EmailAddress Element    ${EXISTING_EMAIL}
        Click Signup Element
        Page Should Contain    ${EMAIL_EXIST_TEXT}
    


Validate Required Fields in Signup Detail Form
    [Documentation]    Checking required fields in the sigunp detail form
    Go To Signup/Login page
    Submit Signup Form with Valid Data          ${user}
    User Redirected to Signup Detail Page
    FOR   ${field}    IN    @{REQUIRED_FIELDS}
        Log    Testing missing field: ${field}
        ${user_copy}=    Copy Dictionary    ${user}
        Set To Dictionary    ${user_copy}    ${field}    ${EMPTY}
        Fill Signup Detail Form With Optional Skip Field    ${user_copy}
        Click Create Account Element
        Check the User not Redirect to Account Created Page
        Reload Page
    END
    
    