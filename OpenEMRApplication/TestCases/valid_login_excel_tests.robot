*** Settings ***
Documentation    Validating valid user credentials 
...    for Open EMR application

Resource    ../Resources/Base/commonfunctionalities.resource
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/DashboardPage.robot

Library    DataDriver    file=../TestData/OpenEMRdata.xlsx        sheet_name=Valid Credential Test    

Test Setup    Start Test
Test Teardown    End Test
Test Template    Valid Credential Template

*** Test Cases ***                #username        password       language            expectedtitle
#Valid Admin Credential Test       admin           pass           English (Indian)    OpenEMR  
#Valid physician Credential Test   physician       physician      English (Indian)    OpenEMR  
Valid Credential Test using ${username} and ${password}
    

*** Keywords ***
Valid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedtitle}   
    LoginPage.Enter Username    ${username}
    LoginPage.Enter Password    ${password}
    LoginPage.Select Language    ${language}
    LoginPage.Click Login
    
    DashboardPage.Page Title Should Be OpenEMR    ${expectedtitle} 
    DashboardPage.Mouse Over Name
    DashboardPage.Click Logout    