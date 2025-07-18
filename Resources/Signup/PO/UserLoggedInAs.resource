*** Settings ***
Library    SeleniumLibrary
Resource    ./SignupKeyword.resource

*** Keywords ***
Account Created Successfully
    Wait Until Element Is Enabled    ${ACCOUNT_CREATED_TEXT}
    Wait Until Element Is Enabled    ${CONTINUE_LINK} 



User Should Be Logged In As
    [Arguments]    ${user}
    Page Should Contain    ${user["NAME"]}