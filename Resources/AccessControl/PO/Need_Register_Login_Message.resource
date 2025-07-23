*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${UNABLE_TO_CONTINUE}=            xpath=//div[@class='modal-body']//p[text()='Register / Login account to proceed on checkout.']


*** Keywords ***
Verify Checkout Blocked For Unlogged User
    Wait Until Element Is Enabled               ${UNABLE_TO_CONTINUE}
