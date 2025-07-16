*** Variables ***

${BROWSER} =    edge
${URL} =                         https://automationexercise.com/  
${CONSENT_TEXT}=                 xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p
${VERIFY_LANDING_PAGE_TEXT} =    xpath=//*[@id="header"]/div/div/div/div[1]/div/a/img
${SIGNUP_LOGIN_LINK} =           xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${VERIFY_LOGIN_TEXT} =           xpath=//*[@id="form"]/div/div/div[1]/div/h2
${VERIFY_SIGNUP_TEXT} =          xpath=//*[@id="form"]/div/div/div[3]/div/h2
${SIGNUP_BUTTON} =               xpath=//*[@id="form"]/div/div/div[3]/div/form/button
${SIGNUP_DETAIL_PAGE_TEXT} =     xpath= //*[@id="form"]/div/div/div/div[1]/h2/b


#signin fields
${NAME_INPUT_SIGNUP} =           xpath=//*[@id="form"]/div/div/div[3]/div/form/input[2]
${EMAIL_INPUT_SIGNUP} =          xpath=//*[@id="form"]/div/div/div[3]/div/form/input[3]

#login field
${EMAIL_INPUT_LOGIN} =           xpath=//*[@id="form"]/div/div/div[1]/div/form/input[2]
${PASSWORD_INPUT_LOGIN} =        xpath=//*[@id="form"]/div/div/div[1]/div/form/input[3]
${LOGIN_BUTTON} =                xpath=//*[@id="form"]/div/div/div[1]/div/form/button

#detail input field and data
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


${CREATE_ACC_BUTTON} =           xpath=//*[@id="form"]/div/div/div/div[1]/form/button
${ACCOUNT_CREATED_TEXT} =        xpath=//*[@id="form"]/div/div/div/h2/b
${CONTINUE_LINK} =               xpath=//*[@id="form"]/div/div/div/div/a

${LOGOUT_LINK} =                 xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${DELETE_ACCOUNT} =              xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${CONFIRM_DELETED_ACC} =         xpath=//*[@id="form"]/div/div/div/h2/b
${AFTER_DELETE_CONTINUE} =       xpath=//*[@id="form"]/div/div/div/div/a

${EMAIL_EXIST_TEXT} =            xpath=//p[text()='Email Address already exist!']




