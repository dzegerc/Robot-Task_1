*** Settings ***
Library        SeleniumLibrary
Resource       ./PO/SignupApp_PO.resource
Resource       ../Common/Landing.resource
Resource       ./PO/NameAndEmailForm.resource
Resource       ./PO/DetailsForm.resource
Resource       ./PO/GenerateUserData.resource


*** Variables ***
@{REQUIRED_FIELDS_FIRST_STEP}    NAME    EMAIL
@{REQUIRED_FIELDS}               PASSWORD    NAME     LASTNAME    ADDRESS    STATE    CITY    ZIPCODE    MOBILE



*** Keywords ***
Go To Signup/Login page
    Landing.Navigate To Home Page
    SignupApp_PO.Click Signup/Login Link
    SignupApp_PO.Signup Page Loaded Successfully


Submit Signup Form with Valid Data
    [Arguments]    ${user}
    Input Accepts Valid Name and Email             ${user["NAME"]}   ${user["EMAIL"]}
    SignupApp_PO.Click Signup Button
    
Input Accepts Valid Name and Email
    [Arguments]                         ${name}    ${emailAddress}
    Input Name Element                             ${name}
    NameAndEmailForm.Input EmailAddress Element    ${emailAddress}

User Redirected to Signup Detail Page
    SignupApp_PO.Successful Redirection To The Signup Details Page 

Filling in The Details Fields
    [Arguments]        ${user}
    DetailsForm.Select Title Element
    DetailsForm.Input Password Eelement            ${user}
    DetailsForm.Select Day Element                 ${user}
    DetailsForm.Select Month Element               ${user}
    DetailsForm.Select Year Element                ${user}
    DetailsForm.Input First Name Element           ${user}
    DetailsForm.Input Last Name Element            ${user}
    DetailsForm.Input Address Element              ${user}
    DetailsForm.Select Country Element             ${user}
    DetailsForm.Input State Element                ${user}
    DetailsForm.Input City Element                 ${user}
    DetailsForm.Input Zipcode Element              ${user}
    DetailsForm.Input Mobile Number Element        ${user}
    
Complete Signup With Valid Details
    [Arguments]       ${user}
    Filling in The Details Fields                  ${user}    
    SignupApp_PO.Click Create Account Element

Account Was Successfully Created
    [Arguments]       ${user}
    SignupApp_PO.Account Created Successfully Message
    SignupApp_PO.Click Continue Button

    
User Should Be Logged In As
    [Arguments]    ${user}
    SignupApp_PO.Checking The Currently Logged In User    ${user}


Skip Name or/and Email Field from Signup page
    [Arguments]     ${user}    ${skip_field}=NONE
    Run Keyword If    '${user["NAME"]}' != ''     Input Name Element             ${user["NAME"]}
    Run Keyword If    '${user["EMAIL"]}' != ''    Input EmailAddress Element     ${user["EMAIL"]}

Validate Missing Field In First Step
    [Arguments]    ${user}    ${missing_field}
    ${user_copy}=    Copy Dictionary    ${user}
    Set To Dictionary    ${user_copy}    ${missing_field}    ${EMPTY}
    Skip Name or/and Email Field from Signup page    ${user_copy}
    SignupApp_PO.Click Signup Button
    Sleep    2s
    SignupApp_PO.User Can Not Visible Signup Dteail Page
    Reload Page


   

Validate Missing Field In Signup Detail Form
    [Arguments]    ${user}    ${missing_field}
    Log    Testing missing field: ${missing_field}
    ${user_copy}=    Copy Dictionary    ${user}
    Set To Dictionary    ${user_copy}    ${missing_field}    ${EMPTY}
    Fill Signup Detail Form With Optional Skip Field    ${user_copy}    ${missing_field}
    SignupApp_PO.Click Create Account Element
    SignupApp_PO.Check The User Not Redirect To Account Created Page
    Reload Page



Fill Signup Detail Form With Optional Skip Field
    [Arguments]    ${user}    ${skip_field}=NONE
    Select Title Element
    Run Keyword If          '${skip_field}' != ''        Input Password Eelement        ${user}
    Select Day Element       ${user}
    Select Month Element     ${user}
    Select Year Element      ${user}
    Run Keyword If          '${skip_field}' != ''        Input First Name Element       ${user}
    Run Keyword If          '${skip_field}' != ''        Input Last Name Element        ${user}
    Run Keyword If          '${skip_field}' != ''        Input Address Element          ${user}
    Select Country Element   ${user}
    Run Keyword If          '${skip_field}' != ''        Input State Element            ${user}
    Run Keyword If          '${skip_field}' != ''        Input City Element             ${user}
    Run Keyword If          '${skip_field}' != ''        Input Zipcode Element          ${user}
    Run Keyword If          '${skip_field}' != ''        Input Mobile Number Element    ${user}



















    