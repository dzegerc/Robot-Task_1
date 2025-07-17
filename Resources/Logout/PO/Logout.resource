*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${LOGOUT_LINK} =                 xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${VERIFY_LOGIN_TEXT} =           xpath=//*[@id="form"]/div/div/div[1]/div/h2
${VERIFY_SIGNUP_TEXT} =          xpath=//*[@id="form"]/div/div/div[3]/div/h2


*** Keywords ***
User Logout
    Click Link    ${LOGOUT_LINK}

User Has Been Successfully Logged Out 
    Wait Until Page Contains Element   ${VERIFY_LOGIN_TEXT}
    Wait Until Page Contains Element   ${VERIFY_SIGNUP_TEXT}
