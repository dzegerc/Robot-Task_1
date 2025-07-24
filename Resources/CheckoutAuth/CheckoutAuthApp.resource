*** Settings ***
Library     SeleniumLibrary
Resource    ./PO/CheckoutAuth_PO.resource



*** Keywords ***
Navigate To Products Page
    CheckoutAuth_PO.Click Product Nav Link
    CheckoutAuth_PO.Wait Until Product Page Enabled     

Add Item To Cart
    [Documentation]    Adding first article to cart
    CheckoutAuth_PO.Scroll To Add To Cart Button
    CheckoutAuth_PO.Scroll Through The Page
    CheckoutAuth_PO.Hover From The Article
    CheckoutAuth_PO.Click Hover Add To Cart Button
    CheckoutAuth_PO.Wait For Successful Add To Cart Message

Redirect To Shopping Cart Page
    [Documentation]    User was successfully redirect to shopping cart page with selected articles
    CheckoutAuth_PO.Click View Cart Link
    CheckoutAuth_PO.Wait For Shopping Cart To Load Successfully

Unlogged User Cannot Proceed To Checkout
    [Documentation]    Click to buttom for checkout, this step must indicate that the user must first log in to website
    CheckoutAuth_PO.Click Proceed To Checkout Button
    CheckoutAuth_PO.Verify Checkout Blocked For Unlogged User

Complete Checkout And Payment As Login User
    [Documentation]  The logged in user can continue oredring and payig for products in the cart
    CheckoutAuth_PO.Click Proceed To Checkout Button
    CheckoutAuth_PO.Scroll To Review Your Order Section
    CheckoutAuth_PO.Scroll Through The Page
    CheckoutAuth_PO.Click Place Order Button
    CheckoutAuth_PO.Wait For Payment Page To Load Successfully
    CheckoutAuth_PO.Fill Payment Fied
    CheckoutAuth_PO.Scroll Through The Page
    CheckoutAuth_PO.Click Pay And Confirm Order Button
    CheckoutAuth_PO.Wait To Order Placed Page Load Successfully


Successfully Redirect User to Home Page After Ordered
    CheckoutAuth_PO.Click To Continue Order Button
    CheckoutAuth_PO.Wait Until Home Page Loaded Successfully

    
