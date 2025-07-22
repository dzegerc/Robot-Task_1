*** Settings ***
Library    SeleniumLibrary
Resource    ../ClickActions/ClickActionsApp.resource
Resource    ../Common/CommonKeywords.resource
Resource    ./PO/PaymentForm.resource


*** Variables ***
${PRODUCTS_LINK} =                xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
${PRODUCT_PAGE_TEXT}=             xpath=/html/body/section[2]/div/div/div[2]/div/h2
${ARTICLE} =                      xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[3]/div/div[1]/div[1]
${ADD_TO_CART_BUTOTN}=            xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[3]/div/div[1]/div[1]/a
${SUCCESSFUL_ADDED_TEXT}=         xpath=//*[@id="cartModal"]/div/div/div[1]/h4
${VIEW_CART_LINK}=                xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a
${SHOPPING_CART_LOADED}=          xpath=//*[@id="cart_items"]/div/div[1]/ol
${PROCEED_TO_CHECKOUT_BUTTON} =   xpath=//*[@id="do_action"]/div[1]/div/div/a
${UNABLE_TO_CONTINUE}=            xpath=//*[@id="checkoutModal"]/div/div/div[2]/p[1]
${REVIEW_ORDER_TEXT}=             xpath=//*[@id="cart_items"]/div/div[4]/h2
${PLACE_ORDER_BUTTON}=            xpath=//*[@id="cart_items"]/div/div[7]/a
${PAYMENT_PAGE_TEXT}=             xpath=//*[@id="cart_items"]/div/div[2]/h2
${ORDER_PLACED_TEXT}=             xpath=//*[@id="form"]/div/div/div/h2/b
${CONTINUE_ORDER_BUTTON}=         xpath=//*[@id="form"]/div/div/div/div/a
${HOME_PAGE_CHECK}=               xpath=//*[@id="header"]/div/div/div/div[1]/div/a/img
${PAY_CONFIRM_BUTTON}=            xpath=//*[@id="submit"]


*** Keywords ***
Navigate To Products Page
    ClickActionsApp.Click Element By Locator    ${PRODUCTS_LINK}
    Wait Until Element Is Enabled               ${PRODUCT_PAGE_TEXT}

Add Item To Cart
    [Documentation]    Adding first article to cart
    Scroll Element Into View                    ${ARTICLE}
    Mouse Over                                  ${ARTICLE}
    Sleep    1s
    Execute JavaScript          document.querySelector('a[data-product-id="2"]').click()
    Wait Until Element Is Enabled               ${SUCCESSFUL_ADDED_TEXT}

Redirect To Shopping Cart Page
    [Documentation]    User was successfully redirect to shopping cart page with selected articles
    Wait Until Element Is Enabled               ${VIEW_CART_LINK}
    ClickActionsApp.Click Element By Locator    ${VIEW_CART_LINK}
    Wait Until Element Is Enabled               ${SHOPPING_CART_LOADED}

Proceed To Checkout With Negative Output
    [Documentation]    Click to buttom for checkout, this step must indicate that the user must first log in to website
    ClickActionsApp.Click Element By Locator    ${PROCEED_TO_CHECKOUT_BUTTON}
    Wait Until Element Is Enabled               ${UNABLE_TO_CONTINUE}

Procees To Checkout and Finish Payment
    [Documentation]  The logged in user can continue oredring and payig for products in the cart
    ClickActionsApp.Click Element By Locator    ${PROCEED_TO_CHECKOUT_BUTTON}
    Scroll Element Into View                    ${REVIEW_ORDER_TEXT}
    Scroll Element Into View                    ${PLACE_ORDER_BUTTON}
    Wait Until Element Is Enabled               ${PLACE_ORDER_BUTTON}
    ClickActionsApp.Click Element By Locator    ${PLACE_ORDER_BUTTON}
    Wait Until Element Is Enabled               ${PAYMENT_PAGE_TEXT}
    Fill Payment Fied
    ClickActionsApp.Click Element By Locator    ${PAY_CONFIRM_BUTTON}
    Wait Until Element Is Enabled               ${ORDER_PLACED_TEXT}

Successfully Redirect User to Home Page After Ordered
    Wait Until Element Is Enabled               ${CONTINUE_ORDER_BUTTON}
    ClickActionsApp.Click Element By Locator    ${CONTINUE_ORDER_BUTTON}
    Wait Until Element Is Enabled               ${HOME_PAGE_CHECK}

    
Fill Payment Fied
    PaymentForm.Input Name Card Element    
    PaymentForm.Input Card Number Element
    PaymentForm.Input CVC Element
    PaymentForm.Input Expiration Mont Element
    PaymentForm.Input Expiration Year Element
    
    

