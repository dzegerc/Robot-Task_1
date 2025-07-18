*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${LOGOUT_LINK} =                 xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a


*** Keywords ***
Click Logout Element
    Click Element By Locator    ${LOGOUT_LINK}