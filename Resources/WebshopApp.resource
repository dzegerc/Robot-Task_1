*** Settings ***

Resource    ./PO/Landing.resource
Resource    ./Signup/PO/Signup.resource
Resource    ./Signup/PO/TopNavSignup.resource
Resource    ./Login/PO/Login.resource
Resource    ./Logout/PO/Logout.resource
Resource    ./DeleteAccount/PO/DeleteAccount.resource



*** Keywords ***
Go To Landing Page
    Landing.Navigate To

Landing Page Loaded Successfully
    Landing.Verify Page Loaded

Go To "Signup/Login" page
    TopNavSignup.Select "Signup/Login" Page

"Signup/Login" Loaded
    TopNavSignup.Page "Signup/Login" Load Successfully

Main Page "Signup"
   [Arguments]    ${user}
    Signup.Signup Main Page       ${user["NAME"]}   ${user["EMAIL"]}

Main Page Negativ Signup
    [Arguments]    ${user}
    Signup.Signup With Existing Email    ${user["NAME"]}   ${user["EMAIL"]}  

Signup Detail Page Load Successfully
    Signup.Signup Detail Page Load Succesfully

Filling New User Details
    [Arguments]    ${user}
    Signup.Signup With Valid Credentials     ${user}

New User Created Succesfully
    Signup.New User Created Successfully

User Login 
    [Documentation]    Ovdje pises detalje
    ...    nesto, nesto
    [Arguments]    ${user}
    Login.Login User    ${user["EMAIL"]}    ${user["PASSWORD"]} 

    

Logout Of User From The Website
    Logout.User Logout
    Logout.User Has Been Successfully Logged Out

Delete User Account
    Delete Account.Delete Account
    Delete Account.Should Be Continue To Home Page

Signup With Empty Field
    [Arguments]    ${user}
    Signup.Negative Tests For All Required Fields    ${user}


    
    