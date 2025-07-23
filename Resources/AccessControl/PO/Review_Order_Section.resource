*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${REVIEW_ORDER_TEXT}=             xpath=//div[@class='step-one']//h2[text()='Review Your Order']


*** Keywords ***
Scroll To Review Your Order Section
    Scroll Element Into View                    ${REVIEW_ORDER_TEXT}
