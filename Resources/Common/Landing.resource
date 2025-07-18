*** Settings ***
Library     SeleniumLibrary
Resource    ../ClickActions/ClickActionsApp.resource


*** Variables ***
${BROWSER} =    edge
${URL} =                         https://automationexercise.com/  
${CONSENT_TEXT}=                 xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//*[@id="header"]/div/div/div/div[1]/div/a/img



*** Keywords ***
Navigate To
    Go To    ${URL}
    Click Element By Locator                       ${CONSENT_TEXT}
    Wait Until Page Contains Element               ${VERIFY_LANDING_PAGE_TEXT}    

