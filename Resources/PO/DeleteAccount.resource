*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables.resource

*** Keywords ***
Delete Account
    Wait Until Element Is Visible    ${DELETE_ACCOUNT}    timeout=10s
    Click Link    ${DELETE_ACCOUNT}
    Wait Until Page Contains Element    ${CONFIRM_DELETED_ACC}

Should Be Continue To Home Page
    Click Link    ${AFTER_DELETE_CONTINUE}
    Wait Until Page Contains Element    ${VERIFY_LANDING_PAGE_TEXT}