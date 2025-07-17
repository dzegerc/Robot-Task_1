*** Settings ***
Documentation    Test cases for signup user on website
Resource    ../../Resources/Common/Common.resource
Resource    ../../Resources/Signup/SignupApp.resource
Task Setup       Begin Web Test
Test Teardown    End Web Test

*** Test Cases ***