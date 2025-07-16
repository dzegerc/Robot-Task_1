*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables.resource


*** Keywords ***
Select "Signup/Login" Page
    Click Link                     ${SIGNUP_LOGIN_LINK}
    Sleep                          time_=3s

Page "Signup/Login" Load Successfully
    Page Should Contain Element    ${VERIFY_LOGIN_TEXT}
    Page Should Contain Element    ${VERIFY_SIGNUP_TEXT}