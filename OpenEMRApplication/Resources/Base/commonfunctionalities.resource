*** Settings ***
Documentation    This file managing browser session for all test cases

Library    SeleniumLibrary    screenshot_root_directory=screenshots/
Library    OperatingSystem

*** Variables ***
${URL}    https://demo.openemr.io/a/openemr/index.php
${BROWSER}    chrome

*** Keywords ***
Start Test
    Append To Environment Variable    PATH    ${EXECDIR}${/}driver    
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    30s
    
End Test
    Close All Browsers