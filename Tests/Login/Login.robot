*** Settings ***
Documentation    Test cases for login user on website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Signup/PO/ClickElement.resource
Resource         ../../Resources/Signup/PO/UserLoggedInAs.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Common/SignupSuite.robot
Resource         ../../Resources/Logout/LogoutApp.resource
Suite Setup      Prepare Test User
Task Setup       Begin Web Test
Test Teardown    End Web Test

*** Test Cases ***
Navigate from Landing Page to Login Page
    Navigate To
    Click Signup/Login Link
    Page Signup/Login Load Successfully

#stavljen je cijeli dio sa signup-om zbog toga što se moraju koristiti isti podaci od kreiranog korisnika (dok ne pronađem bolje rješenje)
User Can Login Successfully
    Navigate To
    Click Signup/Login Link
    Submit Signup Form with Valid Data          ${user}
    User Redirected to Signup Detail Page
    Complete Signup With Valid Details          ${user}
    Account Was Successfully Created            ${user}
    User Logout
    User Has Been Successfully Logged Out
    Submit Valid Login Data                     ${user}

    
    