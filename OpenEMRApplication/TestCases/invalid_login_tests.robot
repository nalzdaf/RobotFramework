*** Settings ***
Documentation    Checking on all invalid credentials

Resource    ../Resources/Base/commonfunctionalities.resource
Resource    ../Resources/Pages/LoginPage.robot

Test Setup    Start Test
Test Teardown    End Test

*** Test Cases ***
Invalid Credential Test
    LoginPage.Enter Username    admin123
    LoginPage.Enter Password    pass
    LoginPage.Select Language    English (Indian)
    LoginPage.Click Login
    
    LoginPage.Validate Error Message    Invalid username or password    