*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test

*** Test Cases ***
Navigate from Landing Page and Complete First Step of Signup
    [Documentation]    Test case for loading landing page and navigate to Signup and login page
    [Tags]             Test 1
    Go To Signup/Login page
    Submit Signup Form with Valid Data         ${user}
   

User Can Sign Up Successfully
    [Documentation]      Test case for completing the registration of a new user
    [Tags]               Test 2
    Go To Signup/Login page
    Submit Signup Form with Valid Data          ${user}
    User Redirected to Signup Detail Page
    Complete Signup With Valid Details          ${user}
    Account Was Successfully Created            ${user}
    User Should be Logged                       ${user}

    

    
