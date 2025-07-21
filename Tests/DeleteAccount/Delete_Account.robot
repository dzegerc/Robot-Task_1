*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Resource         ../../Resources/DeleteAccount/DeleteAccountApp.resource
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test

*** Test Cases ***
Delete User Account 
    [Documentation]      Test case for delete user account and rediretct to home page, checking the account has been deleted
    [Tags]               Test 1
    SignupApp.Go To Signup/Login page
    SignupApp.Submit Signup Form with Valid Data    ${user}
    SignupApp.User Redirected to Signup Detail Page
    SignupApp.Complete Signup With Valid Details    ${user}
    SignupApp.Account Was Successfully Created      ${user}
    SignupApp.User Should be Logged                 ${user}
    DeleteAccountApp.Delete Account
    DeleteAccountApp.Navigate to Home Page After Succesful Deleting
    SignupApp.Go To Signup/Login page
    LoginApp.Submit Valid Login Data                ${user}
    DeleteAccountApp.Verify Deleted Account



    
    

    
