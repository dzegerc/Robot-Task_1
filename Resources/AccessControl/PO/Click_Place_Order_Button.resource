*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${PLACE_ORDER_BUTTON}=            xpath=//a[text()='Place Order']


*** Keywords ***
Click Place Order Button
    ClickActionsApp.Click Element By Locator    ${PLACE_ORDER_BUTTON}
