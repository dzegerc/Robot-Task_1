*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource
Resource    ../PO/SignupKeyword.resource

*** Variables ***
${SIGNUP_LOGIN_LINK} =           xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${VERIFY_LOGIN_TEXT} =           xpath=//*[@id="form"]/div/div/div[1]/div/h2
${VERIFY_SIGNUP_TEXT} =          xpath=//*[@id="form"]/div/div/div[3]/div/h2

*** Keywords ***
Click Signup Element
    Click Element By Locator                    ${SIGNUP_BUTTON}
    
Click Signup/Login Link
    Click Element By Locator                    ${SIGNUP_LOGIN_LINK}
    Sleep                                       time_=3s

Page Signup/Login Load Successfully
    Page Should Contain Element                 ${VERIFY_LOGIN_TEXT}
    Page Should Contain Element                 ${VERIFY_SIGNUP_TEXT}

Click Create Account Element
    Wait Until Element Is Enabled    ${CREATE_ACC_BUTTON}
    Execute JavaScript    document.evaluate("//button[@data-qa='create-account']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()

Continue to User Home Page
    Click Element By Locator                    ${CONTINUE_LINK}


