*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BUTOTN_FIRST}=      xpath=//div[@class='productinfo text-center']//a[@data-product-id='2']


*** Keywords ***
Scroll To Add To Cart Button
    Scroll Element Into View                    ${ADD_TO_CART_BUTOTN_FIRST}