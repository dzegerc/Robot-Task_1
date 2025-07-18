*** Settings ***
Library        SeleniumLibrary
Resource       ../Common/Landing.resource
Resource       ./PO/SignupKeyword.resource
Resource       ./PO/ClickElement.resource
Resource       ./PO/NameAndEmailForm.resource
Resource       ./PO/DetailsForm.resource
Resource       ./PO/UserLoggedInAs.resource

*** Keywords ***
Go To Signup/Login page
    Navigate To
    Click Signup/Login Link
    Page Signup/Login Load Successfully

Submit Signup Form with Valid Data
    [Arguments]    ${user}
    Input Accepts Valid Name and Email        ${user["NAME"]}   ${user["EMAIL"]}
    Click Signup Element
    
Input Accepts Valid Name and Email
    [Arguments]    ${name}    ${emailAddress}
    Input Name Element                             ${name}
    NameAndEmailForm.Input EmailAddress Element    ${emailAddress}

User Redirected to Signup Detail Page
    DetailsForm.Successful Redirection to the Signup Details Page  

Filling in The Details Fields
    [Arguments]        ${user}
    Select Title Element
    Input Password Eelement             ${user}
    Select Day Element                  ${user}
    Select Month Element                ${user}
    Select Year Element                 ${user}
    Input First Name Field              ${user}
    Input Last Name Field               ${user}
    Input Addres Element                ${user}
    Select Country Element              ${user}
    Input State Element                 ${user}
    Input City Element                  ${user}
    Input Zipcode Element               ${user}
    Input Mobile Number Element         ${user}
    
Complete Signup With Valid Details
    [Arguments]       ${user}
    Filling in The Details Fields       ${user}    
    Click Create Account Element

Account Was Successfully Created
    [Arguments]       ${user}
    Account Created Successfully
    Continue to User Home Page
    

User Should be Logged
    [Arguments]       ${user}
    User Should Be Logged In As         ${user}









    