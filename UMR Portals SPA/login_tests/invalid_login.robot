*** Settings ***
Documentation     This test suite containing tests related to invalid login... Titu
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***    USER NAME        PASSWORD
Invalid Username      Titu             ${VALID PASSWORD}

Invalid Password      ${VALID USER}    Titu

Invalid Username And Password
                      Titu             Titu123

Empty Username        ${EMPTY}         ${VALID PASSWORD}

Empty Password        ${VALID USER}    ${EMPTY}

Empty Username And Password
                      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    UMR Portals
