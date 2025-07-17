*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click Element By Locator
    [Arguments]                        ${locator}
    Wait Until Element Is Enabled      ${locator}
    Click Element                      ${locator}