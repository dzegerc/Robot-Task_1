*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource


*** Variables ***
${ADD_TO_CART_BUTOTN_HOVER}=      xpath=//div[@class='overlay-content']//a[@data-product-id='2']


*** Keywords ***
Click Hover Add To Cart Button
    ClickActionsApp.Click Element By Locator    ${ADD_TO_CART_BUTOTN_HOVER}

