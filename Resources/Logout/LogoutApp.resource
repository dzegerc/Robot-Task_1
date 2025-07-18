*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/LogoutClickElement.resource


*** Variables ***
${VERIFY_LOGIN_TEXT} =           xpath=//*[@id="form"]/div/div/div[1]/div/h2
${VERIFY_SIGNUP_TEXT} =          xpath=//*[@id="form"]/div/div/div[3]/div/h2


*** Keywords ***
User Logout
    LogoutClickElement.Click Logout Element

User Has Been Successfully Logged Out 
    Wait Until Element Is Enabled      ${VERIFY_LOGIN_TEXT}
    Wait Until Element Is Enabled      ${VERIFY_SIGNUP_TEXT}
