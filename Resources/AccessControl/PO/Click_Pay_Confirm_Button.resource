*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${PAY_CONFIRM_BUTTON}=            xpath=//button[@id='submit']


*** Keywords ***
Click Pay And Confirm Order Button
    ClickActionsApp.Click Element By Locator   ${PAY_CONFIRM_BUTTON}
