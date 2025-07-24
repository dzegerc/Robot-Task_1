*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource


*** Variables ***
${SIGNUP_LOGIN_LINK} =           xpath=//ul[@class='nav navbar-nav']//a[@href='/login']
${VERIFY_LOGIN_TEXT}=            xpath=//section[@id="form"]//h2[text()='Login to your account']
${VERIFY_SIGNUP_TEXT} =          xpath=//section[@id="form"]//h2[text()='New User Signup!']

${SIGNUP_BUTTON}=                xpath=//button[@class='btn btn-default' and text()='Signup']

${SIGNUP_DETAIL_PAGE_TEXT}=      xpath=//b[text()='Enter Account Information']

${CREATE_ACC_BUTTON} =           xpath=//button[@data-qa='create-account' and text()='Create Account']
${ACCOUNT_CREATED_TEXT} =        xpath=//h2[@data-qa='account-created']
${CONTINUE_BUTTON} =             xpath=//a[@data-qa='continue-button']
${VERIFY_IS_USER_SIGNIN}=        xpath=//ul[@class='nav navbar-nav']//a[@href='/logout']

${EMAIL_EXIST_TEXT} =            xpath=//p[text()='Email Address already exist!']



*** Keywords ***
Click Signup/Login Link
    ClickActionsApp.Click Element By Locator    ${SIGNUP_LOGIN_LINK}

Signup Page Loaded Successfully
    Page Should Contain Element                 ${VERIFY_LOGIN_TEXT}
    Page Should Contain Element                 ${VERIFY_SIGNUP_TEXT}

Click Signup Button
    ClickActionsApp.Click Element By Locator    ${SIGNUP_BUTTON}

Successful Redirection To The Signup Details Page
    Wait Until Element Is Enabled               ${SIGNUP_DETAIL_PAGE_TEXT}


Click Create Account Element
    Wait Until Element Is Enabled               ${CREATE_ACC_BUTTON}
    Execute JavaScript                          document.evaluate("//button[@data-qa='create-account']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()

Account Created Successfully Message
    Wait Until Element Is Enabled               ${ACCOUNT_CREATED_TEXT}
    Wait Until Element Is Enabled               ${CONTINUE_BUTTON}

 
Click Continue Button
    Click Element By Locator                    ${CONTINUE_BUTTON}

Checking The Currently Logged In User
    [Arguments]    ${user}
    Page Should Contain                         ${user["NAME"]}
    
User Can Not Visible Signup Dteail Page
    Element Should Not Be Visible               ${SIGNUP_DETAIL_PAGE_TEXT}


Check The User Not Redirect To Account Created Page
    Element Should Not Be Visible               ${ACCOUNT_CREATED_TEXT}