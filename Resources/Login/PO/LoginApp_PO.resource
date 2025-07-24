*** Settings ***
Library     SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${LOGIN_BUTTON} =                xpath=//button[@class='btn btn-default' and text()='Login']
${VERIFY_IS_USER_LOGGED}=        xpath=//ul[@class='nav navbar-nav']//a[@href='/logout']
${VERIFY_LOGIN_TEXT} =           xpath=//section[@id="form"]//h2[text()='Login to your account']

*** Keywords ***
Click Login Element
    Click Element By Locator         ${LOGIN_BUTTON}


Checking If The User Is Logged In
    Wait Until Element Is Enabled    ${VERIFY_IS_USER_LOGGED}


Checking If Keeps The User On The Current Login Page
    Wait Until Element Is Enabled    ${VERIFY_LOGIN_TEXT}