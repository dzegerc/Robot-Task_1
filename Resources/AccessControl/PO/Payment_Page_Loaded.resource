*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PAYMENT_PAGE_TEXT}=             xpath=//h2[text()='Payment']


*** Keywords ***
Wait For Payment Page To Load Successfully
    Wait Until Element Is Enabled               ${PAYMENT_PAGE_TEXT}
