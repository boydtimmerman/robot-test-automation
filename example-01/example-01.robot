*** Settings ***
Library    SeleniumLibrary

Suite Setup   log to console  Starting my first test
Suite Teardown    Close Browser

*** Test Cases ***
My First Test
    Log To Console    Starting navigate test
    Navigate To Apex
    Log To Console    Stopping navigate test

*** Keywords ***
Navigate To Apex
    Open Browser    https://apex.oracle.com    Firefox
    Maximize Browser Window
    Sleep    5 seconds