*** Settings ***
Library     SeleniumLibrary
Resource    ./PO/DeleteAccountApp_PO.resource


*** Keywords ***
Delete Account
    DeleteAccountApp_PO.Click Delete Account Element
    DeleteAccountApp_PO.Wait For Successful Account Deleted Message
    DeleteAccountApp_PO.Click Continue for Delete Account

Navigate to Home Page After Succesful Deleting
    DeleteAccountApp_PO.Wait For Home Page To Load Successfully

Verify Deleted Account
    DeleteAccountApp_PO.Attempting To Login Again With Deleted Account
