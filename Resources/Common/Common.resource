*** Settings ***
Library     SeleniumLibrary
Resource    ./Landing.resource

*** Keywords ***
Begin Web Test
    Open Browser         about:blank  ${BROWSER}
    Maximize Browser Window
    

End Web Test
    Close All Browsers