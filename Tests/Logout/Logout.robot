*** Settings ***
Documentation    Test cases for log out user from website
Resource         ../../Resources/Common/Common.resource
Resource         ../../Resources/Logout/LogoutApp.resource
Task Setup       Begin Web Test
Test Teardown    End Web Test

*** Test Cases ***
Logout User Process
    LogoutApp.User Logout
    LogoutApp.User Has Been Successfully Logged Out