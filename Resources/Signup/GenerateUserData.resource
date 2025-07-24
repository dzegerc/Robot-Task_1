*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections

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
