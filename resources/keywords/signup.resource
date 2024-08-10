*** Settings ***
Resource    common.resource
Resource    ../locators/signup_page.resource


*** Keywords ***
Open Signup Page And Return MFA
    Open New Page    ${MFA_URL}
    ${mfa_value}=    Get Text    ${TOTPCODE}
    RETURN    ${mfa_value}
