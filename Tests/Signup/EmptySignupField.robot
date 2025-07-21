*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Signup/PO/SignupValidation.resource
Resource         ../../Resources/Common/SignupSuite.robot
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test



*** Test Cases ***
Validate First Step of Signup Page
    [Documentation]    Checking required fields from first page of signup page
    [Tags]    Check: name    check: email address
    ${user}=    Generate Random User Data
    SignupApp.Go To Signup/Login page
    SignupValidation.Required Fields From First Step               ${user}
   

User Cannot Register With Existing Email
    [Tags]    negative    validation    field:email
    NameAndEmailForm.Input Name Element                            ${user["NAME"]}
    NameAndEmailForm.Input EmailAddress Element                    ${EXISTING_EMAIL}
    ClickElement.Click Signup Element
    Page Should Contain                                            ${EMAIL_EXIST_TEXT}
    


Validate Required Fields in Signup Detail Form
    [Documentation]    Checking required fields in the sigunp detail form
    SignupValidation.Prepare Signup Detail Page With Valid User    ${user}
    SignupValidation. Required Fields And Validate Missing         ${user}
    
    