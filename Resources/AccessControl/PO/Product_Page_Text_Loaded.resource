*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCT_PAGE_TEXT}=             xpath=//h2[@class='title text-center' and text()='All Products']

*** Keywords ***
Wait Until Product Page Enabled
        Wait Until Element Is Enabled               ${PRODUCT_PAGE_TEXT}
