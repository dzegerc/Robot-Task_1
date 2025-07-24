*** Settings ***
Library     SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${DELETE_ACCOUNT} =              xpath=//a[@href='/delete_account' and text()=' Delete Account']
${CONFIRM_DELETED_ACC} =         xpath=//b[text()='Account Deleted!']
${AFTER_DELETE_CONTINUE} =       xpath=//div[@class='pull-right']//a[text()='Continue']
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//div[@class='logo pull-left']
${VERIFY_DELETED_TEXT} =         xpath=//p[text()='Your email or password is incorrect!']


*** Keywords ***
Click Delete Account Element
    ClickActionsApp.Click Element By Locator     ${DELETE_ACCOUNT}


Wait For Successful Account Deleted Message
    Wait Until Element Is Enabled                ${CONFIRM_DELETED_ACC}


Click Continue for Delete Account
    ClickActionsApp.Click Element By Locator     ${AFTER_DELETE_CONTINUE}


Wait For Home Page To Load Successfully
    Wait Until Element Is Enabled                ${VERIFY_LANDING_PAGE_TEXT}
    

Attempting To Login Again With Deleted Account
    Wait Until Element Is Enabled                ${VERIFY_DELETED_TEXT}  
    



