*** Settings ***
Library    SeleniumLibrary
Resource   resources.robot  

Suite Setup     Run Keywords    Setup Test Data    Navigate To Homepage
Suite Teardown    Run Keywords    Teardown Test Data    Close Browser

*** Test Cases ***
Create Department
    [Documentation]    Act create a department  
    Set Suite Variable    ${dname}    MARKETING   
    Navigate to Departments
    Add Department    ${dname}    LAS VEGAS

Find Created Department
    [Documentation]    Assert the department creation was successful
    Navigate to Departments
    Page Should Contain    ${dname}

Create An Employee 
    [Documentation]    Act create an employee
    ${randomString}    Create Random Name    
    ${today}    Get Today
    ${sal}    Get Random Number
    Set Suite Variable   ${ename}   ${randomString}
    Navigate To Employees
    Input Employee Data    ${ename}  ${today}  PRESENTER  BLAKE  ${sal}  0  ${dname}

Find Created Employee
    [Documentation]    Test for finding the created employee
    Navigate To Employees
    Page Should Contain    ${ename}

