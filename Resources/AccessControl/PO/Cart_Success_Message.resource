*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${SUCCESSFUL_ADDED_TEXT}=         xpath=//*[@id="cartModal"]/div/div/div[1]/h4


*** Keywords ***
Wait For Successful Add To Cart Message
        Wait Until Element Is Enabled               ${SUCCESSFUL_ADDED_TEXT}
