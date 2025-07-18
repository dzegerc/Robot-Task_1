*** Settings ***
Library    SeleniumLibrary
Resource    ../../ClickActions/ClickActionsApp.resource

*** Variables ***
${LOGIN_BUTTON} =                xpath=//*[@id="form"]/div/div/div[1]/div/form/button


*** Keywords ***    
Click Login Element
    Click Element By Locator    ${LOGIN_BUTTON}

    
