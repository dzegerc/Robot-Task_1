*** Settings ***
Resource         ../../Resources/CheckoutAuth/CheckoutAuthApp.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Common/Common.resource
Task Setup       Common.Begin Web Test
Test Teardown    Common.End Web Test


*** Test Cases ***
Unlogged User Cannot Access Checkout From Cart
    [Documentation]    If the user is not logged in to the website, they cannot complete the order of items they have placed in the cart
    Landing.Navigate To Home Page
    CheckoutAuthApp.Navigate To Products Page
    CheckoutAuthApp.Add Item To Cart
    CheckoutAuthApp.Redirect To Shopping Cart Page
    CheckoutAuthApp.Unlogged User Cannot Proceed To Checkout


Logged User Can Access Checkout From Cart
    [Documentation]    Logged in user can complete the order and payment for the product
    SignupApp.Go To Signup/Login page
    LoginApp.Login Process With Exist User 
    CheckoutAuthApp.Navigate To Products Page
    CheckoutAuthApp.Add Item To Cart
    CheckoutAuthApp.Redirect To Shopping Cart Page
    CheckoutAuthApp.Complete Checkout And Payment As Login User
    CheckoutAuthApp.Successfully Redirect User to Home Page After Ordered

    
    
