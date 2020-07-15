*** Settings ***
Documentation    Page object for handling dashboard page functionalities

Resource    ../Base/commonfunctionalities.resource

*** Variables ***
${NAME LOCATOR}    //span[@data-bind='text:fname']
${LOGOUT LOCATOR}    //li[text()='Logout']

*** Keywords ***
Page Title Should Be OpenEMR
    [Arguments]    ${title}
    Title Should Be    ${title}
    
Mouse Over Name
    Mouse Over    ${NAME LOCATOR}
    
Click Logout
    Click Element    ${LOGOUT LOCATOR}    
