*** Settings ***
Library    SeleniumLibrary
Resource    ../ClickActions/ClickActionsApp.resource

*** Variables ***
${SIGNUP_LOGIN_LINK} =           xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${VERIFY_LOGIN_TEXT} =           xpath=//*[@id="form"]/div/div/div[1]/div/h2
${VERIFY_SIGNUP_TEXT} =          xpath=//*[@id="form"]/div/div/div[3]/div/h2


*** Keywords ***
Select Signup/Login Link
    Click Element By Locator                    ${SIGNUP_LOGIN_LINK}
    Sleep                                       time_=3s

Page Signup/Login Load Successfully
    Page Should Contain Element    ${VERIFY_LOGIN_TEXT}
    Page Should Contain Element    ${VERIFY_SIGNUP_TEXT}

