*** Settings ***
Documentation    Checking database

Resource    ../Resources/Base/commonfunctionalities.resource

Library    DatabaseLibrary
Library    Collections    

#Suite Setup    Connect To Database    pymysql      dbName=dbfree_db    dbUsername=dbfree_db    dbPassword=12345678    dbHost=db4free.net    dbPort=3306
Suite Setup    Connect To Database    pymysql      dbName=test_db    dbUsername=root    dbPassword=11n451R!    dbHost=localhost    dbPort=3306
Suite Teardown    Disconnect From Database

*** Variables ***
${USERNAME}    Fadzlan
@{NAMES}    Zara    Za'im    Zihni
&{CREDENTIALS}    username=root    password=11n451R!
${CREDENTIALS2} =   {'username': 'root2', 'password': '11n451R!'}

*** Test Cases ***
Print Variable Test
    Log To Console    ${USERNAME}    
    Log To Console    ${NAMES}[0] 
    
    FOR    ${name}    IN    @{NAMES}
        Log To Console    ${name}    
    END
    
    Log To Console    ${CREDENTIALS}[username]  
    
    ${keys}    Get Dictionary Keys    ${CREDENTIALS} 
    Log To Console    1. ${keys}  
    Log To Console    2. ${CREDENTIALS}${keys}
    Log To Console    3. ${CREDENTIALS}
    
    #${keys}    Convert To Dictionary    ${CREDENTIALS2}
    Log To Console    4. ${CREDENTIALS2}
    Log To Console    5. ${CREDENTIALS2}

Check Database
    Check If Exists In Database    SELECT * FROM country WHERE code = 'afl'    
    
Row Count
    Row Count Is 0    SELECT * FROM country WHERE 1=2    
    Row Count Is Equal To X    SELECT * FROM country    239   
    Row Count Is Greater Than X    SELECT * FROM country    200 
    Row Count Is Less Than X    SELECT * FROM country    300     
    
Get Queries
    ${rowcount}    Row Count    SELECT * FROM country 
    Log To Console    ${rowcount}     
    
    ${result}    Query    SELECT code, name FROM country WHERE code = 'ATA'
    Log To Console    ${result}  
    Log To Console    ${result}[0]
    Log To Console    ${result}[0][1]
    Log To Console    ${result}[0][1] , ${result}[0][0]       
    