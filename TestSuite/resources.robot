*** Settings ***
Library    String
Library    SeleniumLibrary
Library    DateTime
library    ../Resources/DBkeywords/customkeys.py

*** Variables ***
${SiteUrl}    https://g76171a49f1657e-p24jk8lli6nfg9os.adb.eu-amsterdam-1.oraclecloudapps.com/ords/r/ocw/ocw-demo/
${Browser}     Edge
${Username}    ROBOT
${Password}    robotdemo2023    

*** Keywords ***
Create Random Name
    [Documentation]    Keyword to generate a random 5 letter name
    ${text}=    Generate Random String    5    [UPPER]
    [Return]   ${text}

Get Today
    [Documentation]    Keyword to get the current date
    ${today}    Get Current Date    result_format=%Y-%m-%d 
    [Return]    ${today}

Get Random Number
    [Documentation]    Keyword to generate a random Number
    ${number}=    Generate random string    4    0123456789
    [Return]    ${number}

Navigate To Homepage
    [Documentation]    Keyword to open the OCW demo application
    Log To Console    Arrange: Open application and login
    Open Browser    ${SiteUrl}		${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5 seconds
    Input Text    id:P9999_USERNAME    ${Username}
    Input Password    id:P9999_PASSWORD    ${password}
    Click Button    Sign In
    Wait Until Element Is Visible    css:span.fa-building-o
    Wait Until Element Is Visible    css:span.fa-users

Navigate to Departments
    [Documentation]    Keyword to open the Departments page    
    Click Element    css:span.fa-building-o
    Page Should Contain Element    id:R4_DEPARTMENTS

Add Department
    [Arguments]  ${dname}  ${location}
    Click Button    Create  
    select frame    xpath=//iframe
    Page Should Contain Button    Create
    Page Should Not Contain Button    Apply Changes
    Page Should Not Contain Button    Delete
    Input Text    id:P5_DNAME    ${dname}
    Input Text    id:P5_LOC    ${location}
    Click Button    Create
    Sleep    0.5 seconds
    Unselect Frame
    Element Should Be Visible    id:APEX_SUCCESS_MESSAGE

Navigate To Employees 
    [Documentation]    Keyword to open the Employees page
    Click Element    css:span.fa-users
    Page Should Contain Element    id:R2_EMPLOYEES

Input Employee Data
    [Arguments]  ${ename}  ${today}  ${job}  ${manager}  ${sal}  ${comm}  ${dept}
    Click Button    Create  
    select frame    xpath=//iframe
    Page Should Contain Button    Create
    Page Should Not Contain Button    Apply Changes
    Page Should Not Contain Button    Delete
    Input Text    id:P3_ENAME   ${ename}
    Input Text    id:P3_JOB    ${job}
    Select From List By Label    id:P3_MGR    ${manager}
    Input Text    id:P3_HIREDATE_input    ${today}
    Input Text    id:P3_SAL    ${sal}
    Input Text    id:P3_COMM    ${comm}
    Select From List By Label   id:P3_DEPTNO    ${dept}  
    Click Button    Create
    Sleep    0.5 seconds
    Unselect Frame
    Element Should Be Visible    id:APEX_SUCCESS_MESSAGE

Teardown Test Data
    [Documentation]    Keyword for cleaning the DB
    delete_records_db

Setup Test Data
    [Documentation]    Keyword for inserting clean data
    insert_test_data