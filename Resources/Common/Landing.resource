*** Settings ***
Library     SeleniumLibrary
Resource    ../ClickActions/ClickActionsApp.resource


*** Variables ***
${BROWSER} =                     edge
${URL} =                         https://automationexercise.com/  
${CONSENT_TEXT}=                 xpath=//button[@class='fc-button fc-cta-consent fc-primary-button']//p[text()='Consent']
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//div[@class='logo pull-left']



*** Keywords ***
Navigate To Home Page
    Go To    ${URL}
    Click Element By Locator                       ${CONSENT_TEXT}
    Wait Until Page Contains Element               ${VERIFY_LANDING_PAGE_TEXT}    

