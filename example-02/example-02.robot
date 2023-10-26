*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   variables.resource  

*** Test Cases ***
My Second Test
    ${today}=    Get Today
    Log To Console    ${today}
    Log To Console    Hi, my name is ${name} ${lastname}    

*** Keywords ***
Get Today
    ${date}=    Get Current Date    result_format=%Y-%m-%d
    [Return]    ${date}