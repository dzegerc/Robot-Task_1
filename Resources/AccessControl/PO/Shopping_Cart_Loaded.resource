*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${SHOPPING_CART_LOADED}=          xpath=//ol[@class="breadcrumb"]//li[text()='Shopping Cart']


*** Keywords ***
Wait For Shopping Cart To Load Successfully
    Wait Until Element Is Enabled               ${SHOPPING_CART_LOADED}

    
       
