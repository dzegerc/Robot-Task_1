*** Settings ***
Library    SeleniumLibrary
Resource    ../ClickActions/ClickActionsApp.resource
Resource    ../Common/CommonKeywords.resource
Resource    ./PO/Click_Product_Link.resource
Resource    ./PO/Payment_Form.resource
Resource    ./PO/Product_Page_Text_Loaded.resource
Resource    ./PO/Add_To_Cart_Button.resource
Resource    ./PO/Mouse_Over_Article.resource
Resource    ./PO/Click_Add_To_Card_Hover.resource
Resource    ./PO/Cart_Success_Message.resource
Resource    ./PO/Page_Scroll.resource
Resource    ./PO/Click_View_Link.resource
Resource    ./PO/Shopping_Cart_Loaded.resource
Resource    ./PO/Click_Proceed_To_Checkout.resource
Resource    ./PO/Need_Register_Login_Message.resource
Resource    ./PO/Review_Order_Section.resource
Resource    ./PO/Click_Place_Order_Button.resource
Resource    ./PO/Payment_Page_Loaded.resource
Resource    ./PO/Click_Pay_Confirm_Button.resource
Resource    ./PO/Order_Confirmation_Page_Loaded.resource
Resource    ./PO/Click_Continue_Order_Button.resource
Resource    ./PO/Home_Page_Loaded.resource


*** Keywords ***
Navigate To Products Page
    Click_Product_Link.Click Product Nav Link
    Product_Page_Text_Loaded.Wait Until Product Page Enabled     

Add Item To Cart
    [Documentation]    Adding first article to cart
    Add_To_Cart_Button.Scroll To Add To Cart Button
    Page_Scroll.Scroll Through The Page
    Mouse_Over_Article.Hover From The Article
    Click_Add_To_Card_Hover.Click Hover Add To Cart Button
    Cart_Success_Message.Wait For Successful Add To Cart Message

Redirect To Shopping Cart Page
    [Documentation]    User was successfully redirect to shopping cart page with selected articles
    Click_View_Link.Click View Cart Link
    Shopping_Cart_Loaded.Wait For Shopping Cart To Load Successfully

Unlogged User Cannot Proceed To Checkout
    [Documentation]    Click to buttom for checkout, this step must indicate that the user must first log in to website
    Click_Proceed_To_Checkout.Click Proceed To Checkout Button
    Need_Register_Login_Message.Verify Checkout Blocked For Unlogged User

Complete Checkout And Payment As Login User
    [Documentation]  The logged in user can continue oredring and payig for products in the cart
    Click_Proceed_To_Checkout.Click Proceed To Checkout Button
    Review_Order_Section.Scroll To Review Your Order Section
    Page_Scroll.Scroll Through The Page
    Click_Place_Order_Button.Click Place Order Button
    Payment_Page_Loaded.Wait For Payment Page To Load Successfully
    Payment_Form.Fill Payment Fied
    Page_Scroll.Scroll Through The Page
    Click_Pay_Confirm_Button.Click Pay And Confirm Order Button
    Order_Confirmation_Page_Loaded.Wait To Order Placed Page Load Successfully


Successfully Redirect User to Home Page After Ordered
    Click_Continue_Order_Button.Click To Continue Order Button
    Home_Page_Loaded.Wait Until Home Page Loaded Successfully

    

    
    

