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
    Go To Signup/Login page
    Submit Signup Form with Valid Data          ${user}
    User Redirected to Signup Detail Page
    Complete Signup With Valid Details          ${user}
    Account Was Successfully Created            ${user}
    User Should be Logged                       ${user}
    Delete Account
    Navigate to Home Page After Succesful Deleting
    Click Signup/Login Link
    Submit Valid Login Data                     ${user}
    Verify Deleted Account




    
    

    
