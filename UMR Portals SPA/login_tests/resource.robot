*** Settings ***
Documentation     This is a resource file with reusable keywords and variables.... Titu
Library           Selenium2Library

*** Variables ***
${SERVER}         umrtest.com/UMRPortalsSPA/login
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     33
${VALID PASSWORD}    33
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://umrtest.com/UMRPortalsSPA/
${ERROR URL}      http://${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    UMR Portals

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    id=loginId    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Submit Credentials
    Click Button    class:btn-login

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    UMR Portals
