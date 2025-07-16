*** Settings ***
Library     SeleniumLibrary
Resource    ../Variables.resource

*** Keywords ***
Navigate To
    Go To    ${URL}

Verify Page Loaded
    Click Element                       ${CONSENT_TEXT}
    Wait Until Page Contains Element    ${VERIFY_LANDING_PAGE_TEXT}    
