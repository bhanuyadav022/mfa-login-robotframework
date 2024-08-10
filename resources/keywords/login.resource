*** Settings ***
Resource   common.resource
Resource   signup.resource
Resource  ../locators/login_page.resource



*** Keywords ***    
Open Login Page
    [Arguments]       ${browser_type}      ${headless}  
    Open New Browser  ${browser_type}    ${headless}
    Open New Context
    Open New Page    ${LOGIN_URL}
    
Fetch MFA From Sign Page
  ${MFA}=  Open Signup Page And Return MFA
  Set Suite Variable    ${MFA}
  Close Page
    
Enter Login Credentials
    [Arguments]    ${username}    ${password}    ${mfa}
    Fill Text    ${USERNAME_LOCATOR}    ${username}
    Fill Text    ${PASSWORD_LOCATOR}    ${password}
    Fill Text    ${MFA_LOCATOR}          ${mfa}
    Click        ${SIGN_IN_LOCATOR}

#### Approach 1 for Validation
#### Approach 2 is more acceptable bcoz
#### Code duplication
#### Magic strings
#### Test data separation
# Invalid Username Error
#     Wait For Elements State     ${ERROR_MSG_LOCATOR}
#     Get Text    ${ERROR_MSG_LOCATOR}         ==     Invalid Username!

# Invalid Password Error
#     Wait For Elements State     ${ERROR_MSG_LOCATOR}
#     Get Text    ${ERROR_MSG_LOCATOR}         ==     Invalid Password!

# Invalid MFA Code Error
#     Wait For Elements State     ${ERROR_MSG_LOCATOR}
#     Get Text    ${ERROR_MSG_LOCATOR}         ==     Invalid MFA Code!

# Required MFA Code Error
#     Wait For Elements State     ${ERROR_MSG_LOCATOR}
#     Get Text    ${ERROR_MSG_LOCATOR}         ==     The MFA Code is Required!

# Required Username Error  
#     Wait For Elements State     ${ERROR_MSG_LOCATOR}
#     Get Text    ${ERROR_MSG_LOCATOR}         ==     The Username is Required!

# Required Password Error  
#     Wait For Elements State     ${ERROR_MSG_LOCATOR}
#     Get Text    ${ERROR_MSG_LOCATOR}         ==     The Password is Required!


#### Approach 2 for Validation


Form Validation Error
    [Arguments]         ${expected_error_message}
    Wait For Elements State     ${ERROR_MSG_LOCATOR}
    Get Text    ${ERROR_MSG_LOCATOR}         ==     ${expected_error_message}