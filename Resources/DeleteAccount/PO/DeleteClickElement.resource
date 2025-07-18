*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${DELETE_ACCOUNT} =              xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${AFTER_DELETE_CONTINUE} =       xpath=//*[@id="form"]/div/div/div/div/a


*** Keywords ***
Click Delete Account Element
    Click Element By Locator    ${DELETE_ACCOUNT}

Click Continue for Delete Account
    Click Element By Locator    ${AFTER_DELETE_CONTINUE}


