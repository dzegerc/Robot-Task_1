*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ARTICLE} =                      xpath=//div[@class='productinfo text-center' and a[@data-product-id='2']]


*** Keywords ***
Hover From The Article
        Mouse Over                                  ${ARTICLE}

