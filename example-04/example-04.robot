*** Settings ***
Library    DatabaseLibrary
library    ../Resources/DBkeywords/customkeys.py

Suite Setup    create_oracle_connection
Suite Teardown    delete_records_db

*** Test Cases ***
Simple Test
    Log To Console    Start
    Evaluate    0 < 8 > 10
    Log To Console    End