*** Settings ***
Library     SeleniumLibrary
Resource    ./Landing.resource

*** Keywords ***
Begin Web Test
    Set Selenium Speed    0.5s
    Open Browser         about:blank  ${BROWSER}
    Maximize Browser Window
    

End Web Test
    Close All Browsers