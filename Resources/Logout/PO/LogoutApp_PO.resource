*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${LOGOUT_LINK} =                 xpath=//ul[@class='nav navbar-nav']//a[@href='/logout']
${VERIFY_LOGIN_TEXT}=            xpath=//section[@id="form"]//h2[text()='Login to your account']
${VERIFY_SIGNUP_TEXT} =          xpath=//section[@id="form"]//h2[text()='New User Signup!']

*** Keywords ***
Click Logout Link
    Click Element By Locator    ${LOGOUT_LINK}

User Was Successfully Redirected To Login and Signup Page
    Wait Until Element Is Enabled      ${VERIFY_LOGIN_TEXT}
    Wait Until Element Is Enabled      ${VERIFY_SIGNUP_TEXT}