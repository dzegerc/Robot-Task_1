*** Settings ***
Library     SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${PROCEED_TO_CHECKOUT_BUTTON} =   xpath=//a[text()= 'Proceed To Checkout']


*** Keywords ***
Click Proceed To Checkout Button
    ClickActionsApp.Click Element By Locator    ${PROCEED_TO_CHECKOUT_BUTTON}

