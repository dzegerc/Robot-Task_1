*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections


*** Variables ***
#@{REQUIRED_FIELDS}    ${NAME_INPUT_SIGNUP}    ${EMAIL_INPUT_SIGNUP}    ${PASSWORD_FIELD}    ${FIRST_NAME_FIELD}    ${LAST_NAME_FIELD}    ${ADDRESS_INPUT}    ${STATE_FIELD}    ${CITY_FIELD}    ${ZIPCODE_FIELD}    ${MOBILE_NUMBER_FIELD}
@{REQUIRED_FIELDS}    NAME    EMAIL    PASSWORD    FIRSTNAME    LASTNAME    ADDRESS    STATE    CITY    ZIPCODE    MOBILE
#lista mora uključivati ključeve iz dictionary-a, a ne elemente koje sam definirala u varijablama

${NAME_INPUT_SIGNUP} =           xpath=//*[@id="form"]/div/div/div[3]/div/form/input[2]
${EMAIL_INPUT_SIGNUP} =          xpath=//*[@id="form"]/div/div/div[3]/div/form/input[3]

${TITLE_MRS_SELECT} =            xpath=//*[@id="id_gender2"]
${PASSWORD_FIELD} =              xpath=//*[@id="password"]
${DAY_SELECT} =                  xpath=//*[@id="days"]
${MONTH_SELECT} =                xpath=//*[@id="months"]
${YEAR_SELECT} =                 xpath=//*[@id="years"]
${FIRST_NAME_FIELD} =            xpath=//*[@id="first_name"]
${LAST_NAME_FIELD} =             xpath=//*[@id="last_name"]
${ADDRESS_INPUT} =               xpath=//*[@id="address1"]
${SELECT_COUNTRY} =              xpath=//*[@id="country"]
${STATE_FIELD} =                 xpath=//*[@id="state"]
${CITY_FIELD} =                  xpath=//*[@id="city"]
${ZIPCODE_FIELD} =               xpath=//*[@id="zipcode"]
${MOBILE_NUMBER_FIELD} =         xpath=//*[@id="mobile_number"]
${SIGNUP_BUTTON} =               xpath=//*[@id="form"]/div/div/div[3]/div/form/button
${EMAIL_EXIST_TEXT} =            xpath=//p[text()='Email Address already exist!']
${CREATE_ACC_BUTTON} =           xpath=//*[@id="form"]/div/div/div/div[1]/form/button
${ACCOUNT_CREATED_TEXT} =        xpath=//*[@id="form"]/div/div/div/h2/b
${CONTINUE_LINK} =               xpath=//*[@id="form"]/div/div/div/div/a
${SIGNUP_DETAIL_PAGE_TEXT} =     xpath= //*[@id="form"]/div/div/div/div[1]/h2/b



*** Keywords ***
Generate Random User Data
    ${name} =            Generate Random String        6     [LOWER]
    ${email} =           Set Variable                  ${name}@exampletest.com
    ${password} =        Generate Random String        10    [LETTERS]
    ${day} =             Set Variable                  10        
    ${month} =           Set Variable                  8
    ${year} =            Set Variable                  1997
    ${firstname} =       Set Variable                  ${name}
    ${lastname} =        Generate Random String        6    [LETTERS]
    ${address} =         Set Variable                  Ulica ${name} 1
    ${country} =         Set Variable                  Australia
    ${state} =           Set Variable                  State${lastname}
    ${city} =            Set Variable                  City${name}
    ${zipcode} =         Generate Random String        5    [NUMBERS]
    ${mobile} =          Generate Random String        9    [NUMBERS]

    ${user} =     Create Dictionary
    ...    NAME=${name}
    ...    LASTNAME=${lastname}
    ...    EMAIL=${email}
    ...    PASSWORD=${password}
    ...    DAY=${day}
    ...    MONTH=${month}
    ...    YEAR=${year}
    ...    ADDRESS=${address}
    ...    COUNTRY=${country}
    ...    STATE=${state}
    ...    CITY=${city}
    ...    ZIPCODE=${zipcode}
    ...    MOBILE=${mobile} 
        RETURN    ${user}

Clear Field And Submit
    [Arguments]    ${field_locator}
    Clear Element Text    ${field_locator}
    Click Button          ${SIGNUP_BUTTON}