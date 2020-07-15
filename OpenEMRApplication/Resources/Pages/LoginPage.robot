*** Settings ***
Documentation    Page object for handling login page functionalities

Resource    ../Base/commonfunctionalities.resource

*** Variables ***
${USERNAME LOCATOR}    id=authUser
${PASSWORD LOCATOR}    id=clearPass
${LANGUAGE LOCATOR}    name=languageChoice
${LOGIN LOCATOR}    xpath=//button[@type='submit']


*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME LOCATOR}    ${username}
    
Enter Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD LOCATOR}    ${password}
    
Select Language
    [Arguments]    ${language}
    Select From List By Label    ${LANGUAGE LOCATOR}    ${language}
    
Click Login
    Click Element    ${LOGIN LOCATOR}
    
Validate Error Message
    [Arguments]    ${errormessage}
    Page Should Contain    ${errormessage}