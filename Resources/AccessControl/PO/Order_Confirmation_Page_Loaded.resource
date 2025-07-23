*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ORDER_PLACED_TEXT}=             xpath=//h2[@class='title text-center']//b[text()='Order Placed!']

*** Keywords ***
Wait To Order Placed Page Load Successfully
    Wait Until Element Is Enabled               ${ORDER_PLACED_TEXT}
