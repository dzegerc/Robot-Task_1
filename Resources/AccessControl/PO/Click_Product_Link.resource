*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${PRODUCTS_LINK} =                xpath=//a[contains(text(), 'Products')]


*** Keywords ***
Click Product Nav Link
    ClickActionsApp.Click Element By Locator    ${PRODUCTS_LINK}