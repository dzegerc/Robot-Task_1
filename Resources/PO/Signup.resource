*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables.resource
Resource    ./Keywords.resource

*** Variables ***
@{REQUIRED_FIELDS}    ${NAME_INPUT_SIGNUP}    ${EMAIL_INPUT_SIGNUP}    ${PASSWORD_FIELD}    ${FIRST_NAME_FIELD}    ${LAST_NAME_FIELD}    ${ADDRESS_INPUT}    ${STATE_FIELD}    ${CITY_FIELD}    ${ZIPCODE_FIELD}    ${MOBILE_NUMBER_FIELD}


*** Keywords ***
Signup Main Page
    [Arguments]    ${Name}    ${EmailAddress}
    Fill "Name" Field            ${Name}
    Fill "EmailAddress" Field    ${EmailAddress}    
    Click "Signup" Button

Signup Detail Page Load Succesfully
    Wait Until Page Contains Element     ${SIGNUP_DETAIL_PAGE_TEXT}

Signup With Valid Credentials
    [Arguments]     ${user}
    Fill New User Details    ${user}
    Click "Create Account" Button

Signup With Existing Email
    [Arguments]                          ${Name}    ${ExistingEmail}
    Fill "Name" Field                    ${Name}
    Fill "EmailAddress" Field            ${ExistingEmail}   
    Click "Signup" Button
    Error Message Should Be Displayed    Email Address already exist!
    

New User Created Successfully
    Account Created Successfully
    Display of New User


    
Fill "Name" Field
    [Arguments]      ${Name}
    Log              Filling Name field with ${Name}
    Input Text       ${NAME_INPUT_SIGNUP}    ${Name}

Fill "EmailAddress" Field
    [Arguments]      ${EmailAddress}
    Log              Filling Email address field with ${EmailAddress}
    Input Text       ${EMAIL_INPUT_SIGNUP}    ${EmailAddress}

Click "Signup" Button
    Click Button                 ${SIGNUP_BUTTON}

Fill New User Details
    [Arguments]    ${user}
    Click Element                ${TITLE_MRS_SELECT}
    Input Text                   ${PASSWORD_FIELD}    ${user["PASSWORD"]}
    Scroll Element Into View     ${DAY_SELECT}
    Select From List By Value    ${DAY_SELECT}        ${user["DAY"]}
    Scroll Element Into View     ${MONTH_SELECT}
    Select From List By Value    ${MONTH_SELECT}      ${user["MONTH"]}
    Scroll Element Into View     ${YEAR_SELECT}
    Select From List By Value    ${YEAR_SELECT}       ${user["YEAR"]}
    Input Text                   ${FIRST_NAME_FIELD}  ${user["NAME"]}
    Input Text                   ${LAST_NAME_FIELD}   ${user["LASTNAME"]}
    Input Text                   ${ADDRESS_INPUT}     ${user["ADDRESS"]}
    Select From List By Value    ${SELECT_COUNTRY}    ${user["COUNTRY"]} 
    Input Text                   ${STATE_FIELD}       ${user["STATE"]}
    Input Text                   ${CITY_FIELD}        ${user["CITY"]}
    Input Text                   ${ZIPCODE_FIELD}     ${user["ZIPCODE"]}
    Input Text                   ${MOBILE_NUMBER_FIELD}    ${user["MOBILE"]}


 
Click "Create Account" Button
    Scroll Element Into View    ${CREATE_ACC_BUTTON}
    Sleep    2s
    Execute JavaScript    document.evaluate("//button[@data-qa='create-account']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()


Account Created Successfully
    Wait Until Page Contains Element    ${ACCOUNT_CREATED_TEXT}

Display of New User
    Wait Until Element Is Visible     ${CONTINUE_LINK}    timeout=10s
    Click Link             ${CONTINUE_LINK}

 Error Message Should Be Displayed
     [Arguments]    ${ExpectedMessage}
     Wait Until Element Is Visible    ${EMAIL_EXIST_TEXT}    timeout=10s
     Element Text Should Be           ${EMAIL_EXIST_TEXT}    ${ExpectedMessage}


Negative Tests For Required Fields
    [Arguments]    ${user}
    Input Text    ${EMAIL_INPUT_SIGNUP}   ${user["EMAIL"]}
    Click Button  ${SIGNUP_BUTTON}
    Element Should Be Visible    ${NAME_INPUT_SIGNUP}
    
    
    


    



 