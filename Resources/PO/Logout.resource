*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables.resource


*** Keywords ***
User Logout
    Click Link    ${LOGOUT_LINK}

User Has Been Successfully Logged Out 
    Wait Until Page Contains Element   ${VERIFY_LOGIN_TEXT}
    Wait Until Page Contains Element   ${VERIFY_SIGNUP_TEXT}
