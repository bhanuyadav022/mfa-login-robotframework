*** Settings ***

Variables  ../variables/env_variable.py
Resource  ../locators/login_page.resource
Library    Browser

*** Keywords ***
Open New Browser    
    [Arguments]      ${browser_type}     ${headless}
    New Browser      ${browser_type}     ${headless}

Open New Context
    New Context      

Open New Page
    [Arguments]   ${page_url}
    New Page      ${page_url}


