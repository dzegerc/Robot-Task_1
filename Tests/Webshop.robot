*** Settings ***
Documentation    Automation testing example for website: Automation Exercise 
Resource         ../Resources/Common/Common.resource
Resource         ../Resources/Signup/SignupApp.resource
Resource         ../Resources/Logout/LogoutApp.resource
Resource         ../Resources/Common/SignupSuite.robot
Resource         ../Resources/Login/LoginApp.resource
Resource         ../Resources/DeleteAccount/DeleteAccountApp.resource
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test


*** Test Cases ***
User Registration, Logout, Login and Account Deletion Flow
     [Documentation]      Test case for user registration, logout from the site, 
     ...    registration of a new user to the site and deletion of the user's account
     [Tags]               Test 1
    Go To Signup/Login page
    Submit Signup Form with Valid Data              ${user}
    User Redirected to Signup Detail Page
    Complete Signup With Valid Details              ${user}
    Account Was Successfully Created                ${user}
    User Logout
    User Has Been Successfully Logged Out
    Submit Valid Login Data                         ${user}
    User Should be Logged                           ${user}






















