*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource
Resource    ./Payment_Form.resource


*** Variables ***
${PRODUCTS_LINK} =                xpath=//header[@id='header']//a[@href='/products']
${PRODUCT_PAGE_TEXT}=             xpath=//h2[@class='title text-center' and text()='All Products']
${ADD_TO_CART_BUTOTN_FIRST}=      xpath=//div[@class='productinfo text-center']//a[@data-product-id='2']
${ARTICLE} =                      xpath=//div[@class='productinfo text-center' and a[@data-product-id='2']]
${ADD_TO_CART_BUTOTN_HOVER}=      xpath=//div[@class='overlay-content']//a[@data-product-id='2']
${SUCCESSFUL_ADDED_TEXT}=         xpath=//*[@id="cartModal"]/div/div/div[1]/h4
${VIEW_CART_LINK}=                xpath=//a[@href='/view_cart']//u[text()='View Cart']
${SHOPPING_CART_LOADED}=          xpath=//section[@id='cart_items']//li[text()='Shopping Cart']
${PROCEED_TO_CHECKOUT_BUTTON} =   xpath=//section[@id='do_action']//a[text()= 'Proceed To Checkout']
${UNABLE_TO_CONTINUE}=            xpath=//div[@id='checkoutModal']//p[text()='Register / Login account to proceed on checkout.']
${REVIEW_ORDER_TEXT}=             xpath=//div[@class='step-one']//h2[text()='Review Your Order']
${PLACE_ORDER_BUTTON}=            xpath=//a[text()='Place Order']
${PAYMENT_PAGE_TEXT}=             xpath=//h2[text()='Payment']
${PAY_CONFIRM_BUTTON}=            xpath=//button[@id='submit']
${ORDER_PLACED_TEXT}=             xpath=//h2[@class='title text-center']//b[text()='Order Placed!']
${CONTINUE_ORDER_BUTTON}=         xpath=//div[@class='pull-right']//a[text()='Continue']
${HOME_PAGE_CHECK}=               xpath=//div[@class='logo pull-left']


*** Keywords ***
Click Product Nav Link
    ClickActionsApp.Click Element By Locator        ${PRODUCTS_LINK}


Wait Until Product Page Enabled
        Wait Until Element Is Enabled               ${PRODUCT_PAGE_TEXT}


Scroll To Add To Cart Button
    Scroll Element Into View                        ${ADD_TO_CART_BUTOTN_FIRST}


Scroll Through The Page
    Execute JavaScript                              window.scrollTo(0, 600)


Hover From The Article
        Mouse Over                                  ${ARTICLE}


Click Hover Add To Cart Button
    ClickActionsApp.Click Element By Locator        ${ADD_TO_CART_BUTOTN_HOVER}


Wait For Successful Add To Cart Message
        Wait Until Element Is Enabled               ${SUCCESSFUL_ADDED_TEXT}


Click View Cart Link
    Wait Until Element Is Enabled                   ${VIEW_CART_LINK}
    ClickActionsApp.Click Element By Locator        ${VIEW_CART_LINK}


Wait For Shopping Cart To Load Successfully
    Wait Until Element Is Enabled                   ${SHOPPING_CART_LOADED}


Click Proceed To Checkout Button
    ClickActionsApp.Click Element By Locator        ${PROCEED_TO_CHECKOUT_BUTTON}


Verify Checkout Blocked For Unlogged User
    Wait Until Element Is Enabled                   ${UNABLE_TO_CONTINUE}


Scroll To Review Your Order Section
    Scroll Element Into View                        ${REVIEW_ORDER_TEXT}


Click Place Order Button
    ClickActionsApp.Click Element By Locator        ${PLACE_ORDER_BUTTON}


Wait For Payment Page To Load Successfully
    Wait Until Element Is Enabled                   ${PAYMENT_PAGE_TEXT}

Fill Payment Fied
    Payment_Form.Input Name Card Element
    Payment_Form.Input Card Number Element
    Payment_Form.Input CVC Element
    Payment_Form.Input Expiration Mont Element
    Payment_Form.Input Expiration Year Element

  
Click Pay And Confirm Order Button
    ClickActionsApp.Click Element By Locator        ${PAY_CONFIRM_BUTTON}


Wait To Order Placed Page Load Successfully
    Wait Until Element Is Enabled                   ${ORDER_PLACED_TEXT}


Click To Continue Order Button
    ClickActionsApp.Click Element By Locator        ${CONTINUE_ORDER_BUTTON}


Wait Until Home Page Loaded Successfully
    Wait Until Element Is Enabled                   ${HOME_PAGE_CHECK}






