*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/DeleteClickElement.resource

*** Variables ***
${CONFIRM_DELETED_ACC} =         xpath=//*[@id="form"]/div/div/div/h2/b
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//*[@id="header"]/div/div/div/div[1]/div/a/img
${VERIFY_DELETED_TEXT} =         xpath=//*[@id="form"]/div/div/div[1]/div/form/p
 

*** Keywords ***
Delete Account
    Click Delete Account Element
    Click Continue for Delete Account


Navigate to Home Page After Succesful Deleting
    Wait Until Element Is Enabled     ${VERIFY_LANDING_PAGE_TEXT}


Verify Deleted Account
    Wait Until Element Is Enabled    ${VERIFY_DELETED_TEXT}