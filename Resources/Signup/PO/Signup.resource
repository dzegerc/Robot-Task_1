*** Settings ***
Library    SeleniumLibrary

Resource    ./SignupKeyword.resource

*** Variables ***


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

    
Negative Tests For All Required Fields
    [Arguments]    ${user}
    FOR    ${field}    IN    @{REQUIRED_FIELDS}
    Log    Testing with missing field: ${field}
    Fill New User Details    ${user}    ${field}
    Click "Create Account" Button
    Page Should Not Contain Element    ${ACCOUNT_CREATED_TEXT}
    END
    
    

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
    [Arguments]    ${user}    ${empty_field}=NONE  
    Click Element                ${TITLE_MRS_SELECT}
    IF    $empty_field != "PASSWORD"
        Input Text                   ${PASSWORD_FIELD}    ${user["PASSWORD"]}
    END
    Scroll Element Into View     ${DAY_SELECT}
    Select From List By Value    ${DAY_SELECT}        ${user["DAY"]}
    Scroll Element Into View     ${MONTH_SELECT}
    Select From List By Value    ${MONTH_SELECT}      ${user["MONTH"]}
    Scroll Element Into View     ${YEAR_SELECT}
    Select From List By Value    ${YEAR_SELECT}       ${user["YEAR"]}
    IF    $empty_field != "NAME"
        Input Text                   ${FIRST_NAME_FIELD}  ${user["NAME"]}
    END
    IF    $empty_field != "LASTNAME"
        Input Text                   ${LAST_NAME_FIELD}   ${user["LASTNAME"]}
    END
    IF    $empty_field != "ADDRESS"
        Input Text                   ${ADDRESS_INPUT}     ${user["ADDRESS"]}
    END
    Select From List By Value    ${SELECT_COUNTRY}    ${user["COUNTRY"]}
    IF    $empty_field != "STATE"
        Input Text                   ${STATE_FIELD}       ${user["STATE"]}
    END
    IF    $empty_field != "CITY"
        Input Text                   ${CITY_FIELD}        ${user["CITY"]}
    END
    IF    $empty_field != "ZIPCODE"
        Input Text                   ${ZIPCODE_FIELD}     ${user["ZIPCODE"]}
    END 
    IF    $empty_field != "MOBILE"
        Input Text                   ${MOBILE_NUMBER_FIELD}    ${user["MOBILE"]}
    END


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



    


    



 