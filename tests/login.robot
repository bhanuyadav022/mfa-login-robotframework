*** Settings ***
# Library     resources/variables/env_variable.py
# Variables     resources/variables/env_variable.py
Resource       ../resources/keywords/login.resource
Resource       ../resources/keywords/homepage.resource


*** Variables ***
${INVALID_USERNAME}            INVALID_USERNAME
${INVALID_PWD}                INVALID_PWD
${INVALID_TOKEN}               INVALID_TOKEN

*** Test Cases ***
Validate Successful Login With Valid Credentials
    Open Login Page    chromium    ${False}
    Fetch MFA From Sign Page
    Enter Login Credentials    ${USERNAME}    ${PASSWORD}    ${MFA}     
    Verify User See Home Page 
    Verify Home Page Has Signout menu
    Close Browser
    
Validate Login Fails With Empty Credentials
    Open Login Page    chromium    ${False}
    Enter Login Credentials    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Form Validation Error      The Username is Required!
    Close Browser

Validate Login Fails With Empty Username
    Open Login Page    chromium    ${False}
    Enter Login Credentials    ${EMPTY}    ${PASSWORD}    ${MFA}
    Form Validation Error      The Username is Required!
    Close Browser

Validate Login Fails With Empty Password
    Open Login Page    chromium    ${False}
    Enter Login Credentials    ${USERNAME}    ${EMPTY}    ${MFA}
    Form Validation Error      The Password is Required!
    Close Browser

Validate Login Fails With Invalid USERNAME
    Open Login Page    chromium    ${False}
    Fetch MFA From Sign Page
    Enter Login Credentials    ${INVALID_USERNAME}    ${PASSWORD}    ${MFA}
    Form Validation Error        Invalid Username!
    Close Browser

Validate Login Fails With Invalid PASSWORD
    Open Login Page    chromium    ${False}
    Fetch MFA From Sign Page
    Enter Login Credentials    ${USERNAME}    ${INVALID_PWD}    ${MFA}
    Form Validation Error     Invalid Password!
    Close Browser

Validate Login Fails With Invalid MFA Token
    Open Login Page    chromium    ${False}
    Fetch MFA From Sign Page
    Enter Login Credentials    ${USERNAME}    ${PASSWORD}    ${INVALID_TOKEN}
    Form Validation Error          Invalid MFA Code!
    Close Browser

Validate Login Fails With Empty MFA Token
    Open Login Page    chromium    ${False}
    Fetch MFA From Sign Page
    Enter Login Credentials    ${USERNAME}    ${PASSWORD}    ${EMPTY}
    Form Validation Error        The MFA Code is Required!
    Close Browser





