*** Settings ***
Resource       ../Signup/PO/SignupKeyword.resource

*** Variables ***
${user}=    NONE

*** Keywords ***
Prepare Test User
    ${generated_user}=    Generate Random User Data
    Set Suite Variable    ${user}    ${generated_user}
