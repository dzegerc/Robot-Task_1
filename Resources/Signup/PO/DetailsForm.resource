*** Settings ***
Library      SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource
Resource    ../../Common/CommonKeywords.resource

*** Variables ***
${TITLE_MRS_SELECT} =            xpath=//div[@class='radio-inline']//label[@for='id_gender2']
${PASSWORD_FIELD} =              xpath=//input[@id="password"]
${DAY_SELECT} =                  xpath=//div[@id='uniform-days']//select[@id='days']
${MONTH_SELECT} =                xpath=//div[@id='uniform-months']//select[@id='months']
${YEAR_SELECT} =                 xpath=//div[@id='uniform-years']//select[@id='years']
${FIRST_NAME_FIELD} =            xpath=//input[@id='first_name']
${LAST_NAME_FIELD} =             xpath=//input[@id='last_name']
${ADDRESS_INPUT} =               xpath=//input[@id='address1']
${SELECT_COUNTRY} =              xpath=//select[@id='country']
${STATE_FIELD} =                 xpath=//input[@id='state']
${CITY_FIELD} =                  xpath=//input[@id='city']
${ZIPCODE_FIELD} =               xpath=//input[@id='zipcode']
${MOBILE_NUMBER_FIELD} =         xpath=//input[@id='mobile_number']

*** Keywords ***
Select Title Element
    Click Element By Locator        ${TITLE_MRS_SELECT}

Input Password Eelement
    [Arguments]    ${user}
    Input Text Element              ${PASSWORD_FIELD}         ${user["PASSWORD"]}

Select Day Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${DAY_SELECT}             ${user["DAY"]}

Select Month Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${MONTH_SELECT}           ${user["MONTH"]}

Select Year Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${YEAR_SELECT}            ${user["YEAR"]}

Input First Name Element
    [Arguments]    ${user}
    Input Text Element              ${FIRST_NAME_FIELD}       ${user["NAME"]}


Input Last Name Element
    [Arguments]    ${user}
    Input Text Element              ${LAST_NAME_FIELD}        ${user["LASTNAME"]}

Input Address Element
    [Arguments]    ${user}
    Input Text Element              ${ADDRESS_INPUT}          ${user["ADDRESS"]}

Select Country Element
    [Arguments]    ${user}
    Select Element from Dropdown    ${SELECT_COUNTRY}         ${user["COUNTRY"]}

Input State Element
    [Arguments]    ${user}
    Input Text Element              ${STATE_FIELD}            ${user["STATE"]}

Input City Element
    [Arguments]    ${user}
    Input Text Element              ${CITY_FIELD}             ${user["CITY"]}

Input Zipcode Element
    [Arguments]    ${user}
    Input Text Element              ${ZIPCODE_FIELD}          ${user["ZIPCODE"]}


Input Mobile Number Element
    [Arguments]    ${user}
    Input Text Element              ${MOBILE_NUMBER_FIELD}    ${user["MOBILE"]}


