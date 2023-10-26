*** Settings ***
Library    SeleniumLibrary
Resource    variables.resource

Suite Setup    Log To Console    Starting example-03
Suite Teardown    Close Browser

*** Test Cases ***
My third Test Case
    Navigate To Home Page

*** Keywords ***
Navigate To Home Page
    Open Browser    ${Url}		${Browser}
    Set Selenium Speed    0.5 seconds
    Input Text    id:P9999_USERNAME    ${Username}
    Input Password    id:P9999_PASSWORD    ${password}
    Click Button    Sign In
    Element Should Not Be Visible    id:APEX_ERROR_MESSAGE