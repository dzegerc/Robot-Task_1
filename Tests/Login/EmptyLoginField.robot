*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Resource         ../../Resources/Login/PO/LoginValidation.resource
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test

           


*** Test Cases ***
Validate Login Page with Empty Fields
    [Documentation]    Checking required fileds from first page of signup page
    [Tags]    negativ test: email empty address field    negativ test: password empty field
    SignupApp.Go To Signup/Login page
    LoginValidation.Required Login Fields    ${user}


Validate Login Page with Incorrect Email and Password
    [Tags]    negativ test: login validation
    SignupApp.Go To Signup/Login page
    LoginApp.Input Invalid Login Credentials
    LoginClickElement.Click Login Element
    LoginApp.Verify Login Error Message Is Displayed
   
