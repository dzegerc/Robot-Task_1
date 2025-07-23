*** Settings ***
Documentation    Test cases for signup user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Suite Setup      SignupSuite.Prepare Test User
Task Setup       Common.Begin Web Test
Test Teardown    Common.End Web Test

*** Test Cases ***
Navigate from Landing Page and Complete First Step of Signup
    [Documentation]    Test case for loading landing page and navigate to Signup and login page
    [Tags]             Test 1
    SignupApp.Go To Signup/Login page
    SignupApp.Submit Signup Form with Valid Data      ${user} 
    
   

User Can Sign Up Successfully
    [Documentation]      Test case for completing the registration of a new user
    [Tags]               Test 2
    SignupApp.Go To Signup/Login page
    SignupApp.Submit Signup Form with Valid Data      ${user} 
    SignupApp.User Redirected to Signup Detail Page
    SignupApp.Complete Signup With Valid Details      ${user}
    SignupApp.Account Was Successfully Created        ${user}
    SignupApp.User Should be Logged                   ${user}
   

    

    
