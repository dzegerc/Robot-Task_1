*** Settings ***
Library    SeleniumLibrary
Resource    ../../Common/CommonKeywords.resource

*** Variables ***
#payment inf field and test data
${CARD_NAME_FIELD}=               xpath=//input[@name='name_on_card']
${CARD_NUMBER_FIELD}=             xpath=//input[@name='card_number']
${CVC_FIELD}=                     xpath=//input[@name='cvc']
${EXPIRATION_MONTH_FIELD}=        xpath=//input[@name='expiry_month']
${EXPIRATION_YEAR_FIELD}=         xpath=//input[@name='expiry_year']

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

