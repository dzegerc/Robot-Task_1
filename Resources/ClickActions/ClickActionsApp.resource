*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click Element By Locator
    [Arguments]                        ${locator}
    Wait Until Element Is Visible      ${locator}
    Wait Until Element Is Enabled      ${locator}
    Scroll Element Into View           ${locator}
    Click Element                      ${locator}