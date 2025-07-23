*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${CONTINUE_ORDER_BUTTON}=         xpath=//div[@class='pull-right']//a[text()='Continue']


*** Keywords ***
Click To Continue Order Button
    ClickActionsApp.Click Element By Locator    ${CONTINUE_ORDER_BUTTON}

