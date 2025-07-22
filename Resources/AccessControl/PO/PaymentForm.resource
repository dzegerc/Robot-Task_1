*** Settings ***
Library    SeleniumLibrary
Resource    ../../Common/CommonKeywords.resource

*** Variables ***
#payment inf field and test data
${CARD_NAME_FIELD}=               xpath=//*[@id="payment-form"]/div[1]/div/input
${CARD_NUMBER_FIELD}=             xpath=//*[@id="payment-form"]/div[2]/div/input
${CVC_FIELD}=                     xpath=//*[@id="payment-form"]/div[3]/div[1]/input
${EXPIRATION_MONTH_FIELD}=        xpath=//*[@id="payment-form"]/div[3]/div[2]/input
${EXPIRATION_YEAR_FIELD}=         xpath=//*[@id="payment-form"]/div[3]/div[3]/input 

${NAME_CARD}=    Edvin
${NUMBER_CARD}=  52687413965
${CVC}=          506
${MONTH_EXP}=    05
${YEAR_EXP}=     2028

*** Keywords ***
Input Name Card Element
    CommonKeywords.Input Text Element    ${CARD_NAME_FIELD}           ${NAME_CARD}

Input Card Number Element
    CommonKeywords.Input Text Element    ${CARD_NUMBER_FIELD}         ${NUMBER_CARD}

Input CVC Element
    CommonKeywords.Input Text Element    ${CVC_FIELD}                 ${CVC}

Input Expiration Mont Element
    CommonKeywords.Input Text Element    ${EXPIRATION_MONTH_FIELD}    ${MONTH_EXP}

Input Expiration Year Element
    CommonKeywords.Input Text Element    ${EXPIRATION_YEAR_FIELD}     ${YEAR_EXP}

