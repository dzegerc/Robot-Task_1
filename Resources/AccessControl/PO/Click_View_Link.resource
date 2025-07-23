*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource


*** Variables ***
${VIEW_CART_LINK}=                xpath=//a[@href='/view_cart']//u[text()='View Cart']


*** Keywords ***
Click View Cart Link
    Wait Until Element Is Enabled               ${VIEW_CART_LINK}
    ClickActionsApp.Click Element By Locator    ${VIEW_CART_LINK}