*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGOUT_LINK} =                 xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${DELETE_ACCOUNT} =              xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${CONFIRM_DELETED_ACC} =         xpath=//*[@id="form"]/div/div/div/h2/b
${AFTER_DELETE_CONTINUE} =       xpath=//*[@id="form"]/div/div/div/div/a
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//*[@id="header"]/div/div/div/div[1]/div/a/img


*** Keywords ***
Delete Account
    Wait Until Element Is Visible        ${DELETE_ACCOUNT}        timeout=10s
    Click Link                           ${DELETE_ACCOUNT}
    Wait Until Page Contains Element     ${CONFIRM_DELETED_ACC}

Should Be Continue To Home Page
    Click Link                           ${AFTER_DELETE_CONTINUE}
    Wait Until Page Contains Element     ${VERIFY_LANDING_PAGE_TEXT}