*** Settings ***
Documentation    Automation testing example for website: Automation Exercise 
Resource         ../Resources/Common/Common.resource
Resource         ../Resources/WebshopApp.resource
Task Setup       Begin Web Test
Test Teardown    End Web Test


*** Test Cases ***
Open "Signup/login" Page from Landin Page
    [Documentation]    Test case for loading landing page and navigate to Signup and login page
    [Tags]             Test 1
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded



Start Signup Process
    [Documentation]    Test case for first step for signup new user
    [Tags]              Test 2
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.Main Page "Signup"    ${user}
    WebshopApp.Signup Detail Page Load Successfully

Sign Up With Existing Email
    [Documentation]    Negative test case when using an already registered email
    [Tags]             Test 2a
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.Main Page Negativ Signup    ${user}

Complete User Signup
    [Documentation]    Test case for complete sign up
    [Tags]             Test 3
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.Main Page "Signup"    ${user}
    WebshopApp.Signup Detail Page Load Successfully
    WebshopApp.Filling New User Details   ${user}
    WebshopApp.New User Created Succesfully

Log In User
    [Documentation]    Test case for user Login
    [Tags]             Test 4
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.User Login    ${user}
    

Log Out User From Website
    [Documentation]    Test case for logut user from website
    [Tags]             Test 5
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.User Login    ${user}
    WebshopApp.Logout Of User From The Website

Delete User Account
    [Documentation]    Test case for delete user account
    [Tags]             Test 6
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.User Login    ${user}
    WebshopApp.Delete User Account

Full Signup and Account Flow
     [Documentation]    Test case for full signup process with generated data
     ${user}=    Generate Random User Data
    Log To Console    Email: ${user["EMAIL"]}
    Log To Console    Password: ${user["PASSWORD"]}
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.Main Page "Signup"    ${user}
    WebshopApp.Signup Detail Page Load Successfully
    WebshopApp.Filling New User Details     ${user}
    WebshopApp.New User Created Succesfully
    WebshopApp.Logout Of User From The Website
    WebshopApp.User Login    ${user}
    WebshopApp.Delete User Account

Start Signup Process With Empty Field
    [Documentation]    Test case for first step for signup new user EMPTY FIELD
    [Tags]              Test 10
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.Signup With Empty Field    ${user}

Signup Process With Empty Field Negativ Scenario
    [Documentation]    Test case for first step for signup new user EMPTY FIELD
    [Tags]              Test 10
    ${user}=    Generate Random User Data
    WebshopApp.Go To Landing Page
    WebshopApp.Landing Page Loaded Successfully
    WebshopApp.Go To "Signup/Login" page
    WebshopApp."Signup/Login" Loaded
    WebshopApp.Main Page "Signup"    ${user}
    WebshopApp.Signup With Empty Field    ${user}
