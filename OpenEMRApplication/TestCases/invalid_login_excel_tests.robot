*** Settings ***
Documentation    Checking on all invalid credentials

Resource    ../Resources/Base/commonfunctionalities.resource
Resource    ../Resources/Pages/LoginPage.robot

Library    DataDriver    file=../TestData/OpenEMRdata.xlsx        sheet_name=Invalid Credential Test 

Test Setup    Start Test
Test Teardown    End Test
Test Template    Invalid Credential Template

*** Test Cases ***
Invalid Credential Test ${username} and ${password}

*** Keywords ***
Invalid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedtext}  
    LoginPage.Enter Username    ${username}
    LoginPage.Enter Password    ${password}
    LoginPage.Select Language    ${language}
    LoginPage.Click Login
    
    LoginPage.Validate Error Message    ${expectedtext}   