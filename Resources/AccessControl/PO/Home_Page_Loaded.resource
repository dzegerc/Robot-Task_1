*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_PAGE_CHECK}=               xpath=//div[@class='logo pull-left']
*** Keywords ***
Wait Until Home Page Loaded Successfully
    Wait Until Element Is Enabled               ${HOME_PAGE_CHECK}
