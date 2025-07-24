*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${DELETE_ACCOUNT} =              xpath=//a[@href='/delete_account' and text()=' Delete Account']
${AFTER_DELETE_CONTINUE} =       xpath=//div[@class='pull-right']//a[text()='Continue']


*** Keywords ***
Click Delete Account Element
    Click Element By Locator    ${DELETE_ACCOUNT}

Click Continue for Delete Account
    Click Element By Locator    ${AFTER_DELETE_CONTINUE}


