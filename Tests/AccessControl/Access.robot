*** Settings ***
Resource         ../../Resources/AccessControl/AccessControlApp.resource
Resource         ../../Resources/Signup/SignupApp.resource
Resource         ../../Resources/Login/LoginApp.resource
Resource         ../../Resources/Common/Common.resource
Task Setup       Begin Web Test
Test Teardown    End Web Test


*** Test Cases ***
Unlogged User Cannot Access Checkout From Cart
    [Documentation]    If the user is not logged in to the website, they cannot complete the order of items they have placed in the cart
    Landing.Navigate To Home Page
    AccessControlApp.Navigate To Products Page
    AccessControlApp.Add Item To Cart
    AccessControlApp.Redirect To Shopping Cart Page
    AccessControlApp.Proceed To Checkout With Negative Output


Logged User Can Access Checkout From Cart
    [Documentation]    Logged in user can complete the order and payment for the product
    SignupApp.Go To Signup/Login page
    LoginApp.Login Process With Exist User 
    AccessControlApp.Navigate To Products Page
    AccessControlApp.Add Item To Cart
    AccessControlApp.Redirect To Shopping Cart Page
    AccessControlApp.Procees To Checkout and Finish Payment
    AccessControlApp.Successfully Redirect User to Home Page After Ordered

    
    
