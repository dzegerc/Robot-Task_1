*** Settings ***
Library        SeleniumLibrary
Resource       ../Common/Landing.resource
Resource       ./PO/SignupKeyword.resource
Resource       ./PO/ClickElement.resource
Resource       ./PO/NameAndEmailForm.resource
Resource       ./PO/DetailsForm.resource
Resource       ./PO/UserLoggedInAs.resource

*** Variables ***
@{REQUIRED_FIELDS}               PASSWORD    NAME     LASTNAME    ADDRESS    STATE    CITY    ZIPCODE    MOBILE
@{REQUIRED_FIELDS_FIRST_STEP}    NAME    EMAIL


*** Keywords ***
Go To Signup/Login page
    Navigate To Home Page
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
    Input First Name Element            ${user}
    Input Last Name Element             ${user}
    Input Address Element               ${user}
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

Skip Name or/and Email Field from Signup page
    [Arguments]     ${user}    ${skip_field}=NONE
    Run Keyword If    '${user["NAME"]}' != ''     Input Name Element             ${user["NAME"]}
    Run Keyword If    '${user["EMAIL"]}' != ''    Input EmailAddress Element     ${user["EMAIL"]}

Validate Missing Field In First Step
    [Arguments]    ${user}    ${missing_field}
    ${user_copy}=    Copy Dictionary    ${user}
    Set To Dictionary    ${user_copy}    ${missing_field}    ${EMPTY}
    Skip Name or/and Email Field from Signup page    ${user_copy}
    Click Signup Element
    Sleep    2s
    Check the User not Redirect to Detail Page
    Reload Page

Check the User not Redirect to Detail Page
    Element Should Not Be Visible    ${SIGNUP_DETAIL_PAGE_TEXT}

Validate Missing Field In Signup Detail Form
    [Arguments]    ${user}    ${missing_field}
    Log    Testing missing field: ${missing_field}
    ${user_copy}=    Copy Dictionary    ${user}
    Set To Dictionary    ${user_copy}    ${missing_field}    ${EMPTY}
    Fill Signup Detail Form With Optional Skip Field    ${user_copy}    ${missing_field}
    Click Create Account Element
    Check the User not Redirect to Account Created Page
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



Check the User not Redirect to Account Created Page
    Element Should Not Be Visible    ${ACCOUNT_CREATED_TEXT}

    











    