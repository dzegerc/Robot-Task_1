*** Settings ***
Library    SeleniumLibrary
Resource    ./SignupKeyword.resource
Resource    ../../ClickActions/ClickActionsApp.resource
Resource    ../../Common/CommonKeywords.resource

*** Keywords ***
Successful Redirection to the Signup Details Page
    Wait Until Element Is Enabled        ${SIGNUP_DETAIL_PAGE_TEXT}    timeout=15s

Select Title Element
    Click Element By Locator    ${TITLE_MRS_SELECT}

Input Password Eelement
    [Arguments]    ${user}
    Input Text Element              ${PASSWORD_FIELD}        ${user["PASSWORD"]}

Select Day Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${DAY_SELECT}    ${user["DAY"]}

Select Month Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${MONTH_SELECT}      ${user["MONTH"]}

Select Year Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${YEAR_SELECT}       ${user["YEAR"]}

Input First Name Field
    [Arguments]    ${user}
    Input Text Element              ${FIRST_NAME_FIELD}  ${user["NAME"]}


Input Last Name Field
    [Arguments]    ${user}
    Input Text Element              ${LAST_NAME_FIELD}   ${user["LASTNAME"]}

Input Addres Element
    [Arguments]    ${user}
    Input Text Element               ${ADDRESS_INPUT}     ${user["ADDRESS"]}

Select Country Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${SELECT_COUNTRY}    ${user["COUNTRY"]}

Input State Element
    [Arguments]    ${user}
    Input Text Element              ${STATE_FIELD}       ${user["STATE"]}

Input City Element
    [Arguments]    ${user}
    Input Text Element              ${CITY_FIELD}        ${user["CITY"]}

Input Zipcode Element
    [Arguments]    ${user}
    Input Text Element              ${ZIPCODE_FIELD}     ${user["ZIPCODE"]}


Input Mobile Number Element
    [Arguments]    ${user}
    Input Text Element              ${MOBILE_NUMBER_FIELD}    ${user["MOBILE"]}


