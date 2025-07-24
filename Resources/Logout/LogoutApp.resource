*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/LogoutApp_PO.resource


*** Keywords ***
User Logout
    LogoutApp_PO.Click Logout Link

User Has Been Successfully Logged Out 
    LogoutApp_PO.User Was Successfully Redirected To Login and Signup Page
