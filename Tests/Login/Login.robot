*** Settings ***
Documentation    Test cases for login user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Resource         ../../Resources/Logout/LogoutApp.resource
Suite Setup      SignupSuite.Prepare Test User
Task Setup       Common.Begin Web Test
Test Teardown    Common.End Web Test

*** Test Cases ***
Navigate from Landing Page to Login Page
    SignupApp.Go To Signup/Login page

#stavljen je cijeli dio sa signup-om zbog toga što se moraju koristiti isti podaci od kreiranog korisnika (dok ne pronađem bolje rješenje)
User Can Login Successfully
    SignupApp.Go To Signup/Login page
    SignupApp.Submit Signup Form with Valid Data    ${user}
    SignupApp.User Redirected to Signup Detail Page
    SignupApp.Complete Signup With Valid Details    ${user}
    SignupApp.Account Was Successfully Created      ${user}
    LogoutApp.User Logout
    LogoutApp.User Has Been Successfully Logged Out
    LoginApp.Submit Valid Login Data                ${user}

    
    