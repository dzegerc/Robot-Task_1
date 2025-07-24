*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/DeleteClickElement.resource

*** Variables ***
${CONFIRM_DELETED_ACC} =         xpath=//b[text()='Account Deleted!']
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//div[@class='logo pull-left']
${VERIFY_DELETED_TEXT} =         xpath=//p[text()='Your email or password is incorrect!']
 

*** Keywords ***
Delete Account
    Click Delete Account Element
    Click Continue for Delete Account


Navigate to Home Page After Succesful Deleting
    Wait Until Element Is Enabled     ${VERIFY_LANDING_PAGE_TEXT}


Verify Deleted Account
    Wait Until Element Is Enabled    ${VERIFY_DELETED_TEXT}