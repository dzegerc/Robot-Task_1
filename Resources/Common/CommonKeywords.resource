*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Input Text Element
    [Arguments]                      ${locator}    ${text}
    Wait Until Element Is Enabled    ${locator}
    Input Text                       ${locator}    ${text}

Select Element from Dropdown
    [Arguments]                      ${locator}    ${value}
    Wait Until Element Is Enabled    ${locator}
    Select From List By Value        ${locator}    ${value}

Get Text from Element
    [Arguments]                       ${locator}
    Wait Until Element Is Visible     ${locator}
    ${text} =    Get Text             ${locator}
    RETURN    ${text}