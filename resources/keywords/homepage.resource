*** Settings ***
Resource  common.resource
Resource     ../locators/home_page.resource

*** Keywords ***
Verify User See Home Page 
    Wait For Elements State    ${HEADER_LOCATOR}

Verify Home Page Has Signout menu
    Wait For Elements State    ${SIGNOUT_LOCATOR}
